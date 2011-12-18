// template_specifications1.cpp
template <class T, int i> class TestClass: public ParentA, virtual ParentB {
public:
   char buffer[i];
   T testFunc(T* p1 );
   class InnerClass {

   } const a;
};
;
template <class T, int i>
T TestClass<T,i>::testFunc(T* p1) {
    return *(p1++);
};

// To create an instance of TestClass
TestClass<char, 5> ClassInst;
int main()
{
}
