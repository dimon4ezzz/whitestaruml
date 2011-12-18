interface IIncrement
{
   void Increment();
}

struct IntHolderStruct: IIncrement
{
   int value;

   public IntHolderStruct(int value)
   {
      this.value = value;
   }
   public int[] Value
   {
      get
      {
         return(value);
      }
	set
	{
	}
   }

   public void Increment()
   {
      value++;
   }

   public override string ToString()
   {
      return(value.ToString());
   }
}
