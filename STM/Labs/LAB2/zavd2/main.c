#include "define.h"

int main(void){
	
	static const int i = 8;
	static const int m = i-2;
	unsigned int x[] = {1845,2,4,5};
	unsigned int y[] = {4,3,5,3,6,7,9,10};
	unsigned int z[m];
	long long result; 	
	
	if(i%2==0 && i!=0)
	{
		add_mul(y, z, i);
	}
	else printf("Incorrect value");
	
	result = u_add (x, 4);
	
	while(1);
}