//  Define PVFN to represent a pointer to a function that
//   returns type void.
typedef void (*PVFN)();


const char *const msg = "?? oops: error: ";

class Test {

public:
// type_names.cpp
// Prototype two functions.
void func1(){};
void func2(){};

void printf(arg_list, ...);
template <class Type>
Type min(Type a, Type b) { }

int main()
{
   // Declare an array of pointers to functions.
   PVFN pvfn[] = { func1, func2 };
   
   // Invoke one of the functions.
   (*pvfn[1])();
}
}