#include <iostream>

class Base {
public:
    virtual void foo() {
        std::cout << "Base::foo()" << std::endl;
    }
};

class Derived : public Base {
private:
    virtual void foo() {
        std::cout << "Derived::foo()" << std::endl;
    }
};

int main() {
    Base* ptr = new Derived();
    ptr->foo();

    delete ptr;
    return 0;
}
