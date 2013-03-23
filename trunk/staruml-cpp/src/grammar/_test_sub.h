namespace Top {

class Class1 {
public:
	class InnerClass {
	public:
		void OperationA();
	};
	void SomeOperation(int a);
};

}

namespace Top::Second::Other {

class Class2 {
  friend class Class1;
  friend void main() { };
};

}