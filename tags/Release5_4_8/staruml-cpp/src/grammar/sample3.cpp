#include <iostream.h>
#include <stdlib.h>
#include <stdio.h>
#include "pgmr.h"
#include "pgmrpriv.h"

void main()
{
 char* PathName = "f:\\programmer\\cpp\\Cpp.GMR" ;

 ProGrammarAPI pgmrAPI;

 if (! pgmrAPI.Init()) // initialize ProGrammar library
 {
  exit(1); // fatal error - could not initialize
 }

 PGGrammar* pGrammar = pgmrAPI.LoadGrammar( PathName);
long FileSize =
ProGrammarAPI::GetFileSize("f:\\programmer\\anagram\\atulBackEnd.cpp" );

 FileSize++;  // make room for the trailing NULL

 char* pInputBuffer = new char [FileSize];

 if ( pInputBuffer != NULL &&
  ProGrammarAPI::LoadFile( PathName, pInputBuffer, FileSize) > 0 )
 {
  if (pGrammar != NULL)
  {
   PGParseTree* pParseTree =
   pgmrAPI.Parse(  pGrammar,
       "Cpp.program",
       pInputBuffer,
       FileSize);

   if (pParseTree != NULL)
   {
    //  ... use the data from the parse tree ...

    pgmrAPI.DeleteParseTree( pParseTree );
   }
   pgmrAPI.UnloadGrammar( pGrammar );
  }
 }
 return;
}


