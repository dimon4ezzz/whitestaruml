namespace ShareBaby
{
    using System;
    using System.Net;
	using System.Net.Sockets;

	class Pinger 
	{
	    const int SOCKET_ERROR = -1;        
	    const int ICMP_ECHO = 8;

		public Pinger()
		{
				// Default constructor	
		}

		public int GetPingTime(string host)
		{
			int PingTime = 0;

	        IPHostEntry serverHE, fromHE;
	        int nBytes = 0;
	        int dwStart = 0, dwStop = 0;
	        IcmpPacket packet = new IcmpPacket();

			if (host == null)
	        {
	       	 	return -1;
	        }
	        
	        Socket socket = new Socket(AddressFamily.AfINet, SocketType.SockRaw, ProtocolType.ProtICMP);

	        // Get the server endpoint
	        serverHE = DNS.GetHostByName(host);

	        if (serverHE == null) {
	            return -1; // fail
	        }

			// Convert the server IP_EndPoint to an EndPoint
	        IPEndPoint ipepServer = new IPEndPoint(serverHE.AddressList[0], 0);
	        EndPoint epServer = (ipepServer);	

			// Set the receiving endpoint to the client machine
	        fromHE = DNS.GetHostByName(DNS.GetHostName());
	        IPEndPoint ipEndPointFrom = new IPEndPoint(fromHE.AddressList[0], 0);        
	        EndPoint EndPointFrom = (ipEndPointFrom);

	        int PacketSize = 0;

	        for (int j = 0; j < 1; j++)
	        {
	            // Construct the packet to send
	            packet.Type = ICMP_ECHO;
	            packet.SubCode = 0;
	            packet.CheckSum = UInt16.Parse("0");
	            packet.Identifier   = UInt16.Parse("45"); 
	            packet.SequenceNumber  = UInt16.Parse("0"); 

	            int PingData = 32; // sizeof(IcmpPacket) - 8;

	            packet.Data = new Byte[PingData];

	            for (int i = 0; i < PingData; i++)
	                packet.Data[i] = (byte)'#';

	            PacketSize = PingData + 8;

	            //
	            // since we have to serialize the final byte array into a UInt16 array,
	            // let us make our life easy by making sure that the icmp_pkt_buffer
	            // byte array is of an even size ( > PacketSize ) if the size of the IcmpPacket
	            // is not even
	            //
	            if( PacketSize % 2 == 1 )
	                ++PacketSize;

	            Byte [] icmp_pkt_buffer = new Byte[ PacketSize ]; 

	            Int32 Index = 0;
	            
	            Index = Serialize(  
	                        packet, 
	                        icmp_pkt_buffer, 
	                        PacketSize, 
	                        PingData );

	            if( Index == -1 )
	                return -1;


	            //
	            // now get this critter into a UInt16 array
	            //
	            
	            Double double_length = Convert.ToDouble(Index);
	        
	            Double dtemp = Math.Ceil( double_length / 2);

	            int cksum_buffer_length = Convert.ToInt32(dtemp);
	            
	            UInt16 [] cksum_buffer = new UInt16[cksum_buffer_length];

	            int icmp_header_buffer_index = 0;

	            for( int i = 0; i < cksum_buffer_length; i++ ) {
	                cksum_buffer[i] = 
	                    BitConverter.ToUInt16(icmp_pkt_buffer,icmp_header_buffer_index);
	                icmp_header_buffer_index += 2;
	            }

	                            
	            UInt16 u_cksum = checksum(cksum_buffer, cksum_buffer_length);
	            packet.CheckSum  = u_cksum; 
	            
	            // Now that we have the checksum, serialize the packet again
	            Byte [] sendbuf = new Byte[ PacketSize ]; 
	            
	            Index = Serialize(  
	                        packet, 
	                        sendbuf, 
	                        PacketSize, 
	                        PingData );

	            if( Index == -1 )
	                return -1;

	            dwStart = System.Environment.TickCount; // Start timing

	            if ((nBytes = socket.SendTo(sendbuf, PacketSize, 0, epServer)) == SOCKET_ERROR) {

	                Console.WriteLine("Error calling sendto");
	                return -1; // fail
	            }

	            // Initialize the buffers. The receive buffer is the size of the
	            // ICMP header plus the IP header (20 bytes)
	            Byte [] ReceiveBuffer = new Byte[256]; 

	            nBytes = 0;
	            nBytes = socket.ReceiveFrom(ReceiveBuffer, 256, 0, ref EndPointFrom);

	            if (nBytes == SOCKET_ERROR) 
	            {
					dwStop = SOCKET_ERROR;
	            } 
	            else 
	            {
		            dwStop = System.Environment.TickCount - dwStart; // stop timing
	    	    }
	        }

	        socket.Close();     
			PingTime = (int)dwStop;
			return PingTime;
		}

	    public Int32 Serialize(  IcmpPacket packet, Byte [] Buffer, Int32 PacketSize, Int32 PingData )
	    {
	        Int32 cbReturn = 0;

	        //
	        // serialize the struct into the array
	        //
	        int Index=0;

	        Byte [] b_type = new Byte[1];
	        b_type[0] = (packet.Type);

	        Byte [] b_code = new Byte[1];
	        b_code[0] = (packet.SubCode);

	        Byte [] b_cksum = BitConverter.GetBytes(packet.CheckSum);
	        Byte [] b_id = BitConverter.GetBytes(packet.Identifier);
	        Byte [] b_seq = BitConverter.GetBytes(packet.SequenceNumber);
	        
	        // Console.WriteLine("Serialize type ");
	        Array.Copy( b_type, 0, Buffer, Index, b_type.Length );
	        Index += b_type.Length;
	        
	        // Console.WriteLine("Serialize code ");
	        Array.Copy( b_code, 0, Buffer, Index, b_code.Length );
	        Index += b_code.Length;

	        // Console.WriteLine("Serialize cksum ");
	        Array.Copy( b_cksum, 0, Buffer, Index, b_cksum.Length );
	        Index += b_cksum.Length;

	        // Console.WriteLine("Serialize id ");
	        Array.Copy( b_id, 0, Buffer, Index, b_id.Length );
	        Index += b_id.Length;

	        Array.Copy( b_seq, 0, Buffer, Index, b_seq.Length );
	        Index += b_seq.Length;

	        // copy the data
	        
	        Array.Copy( packet.Data, 0, Buffer, Index, PingData );

	        Index += PingData;

	        if( Index != PacketSize/* sizeof(IcmpPacket)  */) {
	            cbReturn = -1;
	            return cbReturn;
	        }

	        cbReturn = Index;
	        return cbReturn;
	    }

		public UInt16 checksum( UInt16[] buffer, int size )
		{
		    Int32 cksum = 0;
		    int counter;

		    counter = 0;

	        while ( size > 0 ) {

	            UInt16 val = buffer[counter];

	            cksum += Convert.ToInt32( buffer[counter] );
		        counter += 1;
		        size -= 1;
		    }

	        cksum = (cksum >> 16) + (cksum & 0xffff);
		    cksum += (cksum >> 16);
		    return (UInt16)(~cksum);
		}
	} // class ping

	public class IcmpPacket 
	{ 
	    public Byte  Type;    // type of message
	    public Byte  SubCode;    // type of sub code
	    public UInt16 CheckSum;   // ones complement checksum of struct
	    public UInt16 Identifier;      // identifier
	    public UInt16 SequenceNumber;     // sequence number  
	    public Byte [] Data;

	} // class IcmpPacket
}

