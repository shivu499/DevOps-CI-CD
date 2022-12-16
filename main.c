#include <stdio.h>
#include <stdlib.h>


void find_area(float Pi, float radius){

    float area;
    area = Pi * radius * radius;
    printf("Area of circle is: %f\n",area);
}


void find_circumference(float Pi, float radius){
    
    float circumference;
    circumference = 2 * Pi * radius;
    printf("Circumference of circle is: %f\n", circumference);
}


int main(int argc, char *argv[])
{
    float Pi=3.14, area, circumference, radius;
    char *a = argv[1];
    radius = atoi(a);
    
    //Calculate and print the Area of circle
    find_area(Pi, radius);
    
    //Calculate and print the Circumference of circle
    find_circumference(Pi, radius);
    return 0;
}
