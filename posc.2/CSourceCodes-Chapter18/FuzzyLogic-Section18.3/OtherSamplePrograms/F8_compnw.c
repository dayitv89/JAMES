#include<stdio.h>
#include<alloc.h>
#include<conio.h>
#include<stdlib.h>

#define min(x,y) (x<y ? x : y)

struct SET
{
  float nr[5];
  float dr[5];
  int n;
};

typedef struct SET fuzzy;

void printval(fuzzy *m,char *x)
{
   int i;
   printf("\n %s={",x);
   for(i=0;i<m->n;i++)
   {
     printf(" %5.2f /%5.2f ",m->nr[i],m->dr[i]);
     if(i!=m->n-1) putch('+');
   }
   printf(" }");
}

void cartesian_product(fuzzy *x,fuzzy *y,float ***m)
{
  int i,j;
  float **z=*m;
  for(i=0;i<=x->n;i++)
     for(j=0;j<=y->n;j++)
     {
       if(i==0 && j>0)
	  *(*(z+i)+j)=y->dr[j-1];
       else if(j==0 && i>0)
	  *(*(z+i)+j)=x->dr[i-1];
       else if(i>0 && j>0)
	  *(*(z+i)+j)=min(x->nr[i-1],y->nr[j-1]);
     }
}

void printmat(float **x,int row,int col)
{
   int i,j;
   for(i=0;i<=row;i++)
   {
     for(j=0;j<=col;j++)
     {
       if(i==0 && j==0)
	  printf("        ");
       else
	  printf(" %6.2f ",*(*(x+i)+j));
     }
     printf("\n");
   }
}

void main()
{
   fuzzy V,I,C;
   int i,j;
   float P[6][6],T[6][4];

   clrscr();

   V.n=I.n=5;  C.n=3;

   V.nr[0]=0.2;     V.dr[0]=30;
   V.nr[1]=0.8;     V.dr[1]=45;
   V.nr[2]=1;       V.dr[2]=60;
   V.nr[3]=0.9;     V.dr[3]=75;
   V.nr[4]=0.7;     V.dr[4]=90;

   I.nr[0]=0.4;     I.dr[0]=0.8;
   I.nr[1]=0.7;     I.dr[1]=0.9;
   I.nr[2]=1;       I.dr[2]=1;
   I.nr[3]=0.8;     I.dr[3]=1.1;
   I.nr[4]=0.6;     I.dr[4]=1.2;

   C.nr[0]=0.4;     C.dr[0]=0.5;
   C.nr[1]=1;       C.dr[1]=0.6;
   C.nr[2]=0.5;     C.dr[2]=0.7;

   printval(&V,"V");
   printval(&I,"I");
   printval(&C,"C");
   printf("\n\n");

   cartesian_product(&V,&I,&P);
   cartesian_product(&I,&C,&T);

   printmat(P,5,5);
   printf("\n");
   printmat(T,5,3);

   getch();
   clrscr();

}