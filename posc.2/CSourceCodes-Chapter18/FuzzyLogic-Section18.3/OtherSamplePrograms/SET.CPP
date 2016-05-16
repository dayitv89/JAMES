#include<stdio.h>
#include<alloc.h>
#include<conio.h>
#include<stdlib.h>

struct SET
{
  char *elts;
  int n;
};

typedef struct SET set;
set s;

void getval(set m,char *x)
{
   int i,j;
   clrscr();
   printf("\n Enter the %s:\n",x);
   for(i=0;i<m.n;i++)
   {
      fflush(stdin);
      printf(" Element %d:",i+1);
      scanf("%c",&m.elts[i]);
      for(j=0;j<i;j++)
	{
	if(m.elts[i]==m.elts[j])
		{
		printf("Set error");
		getch();
		exit(1);
		}
	}
      if(*x!='S')
	{
	j=0;
	while(s.elts[j]!=m.elts[i] && j!=s.n)
		j++;
	if(j==s.n)
		{
		printf("Enter a element present in set S");
		getch();
		exit(1);
		}
	}
   }
}

void printval(set m,char *x)
{
   int i;
   printf("\n %s ={",x);
   for(i=0;i<m.n;i++)
   {
     printf("%c",m.elts[i]);
     if(i!=m.n-1) putch(',');
   }
   printf("}");
}

set unionset(set t1,set t2)
{
   set temp;
   char ch;
   int i,j,found;
   temp.elts=(char *)malloc(t1.n+t2.n);
   temp.n=0;
   for(i=0;i<t1.n;i++)
   {
     temp.elts[temp.n]=t1.elts[i];
     temp.n++;
   }
   for(j=0;j<t2.n;j++)
   {
      found=0;
      ch=t2.elts[j];
      for(i=0;i<t1.n;i++)
	if(t1.elts[i]==ch)
	   found=1;

      if(found==0)
       {
	 temp.elts[temp.n]=ch;
	 temp.n++;
      }
   }
   return temp;
}

set intersect(set a,set b)
{
  set temp;
  char ch;
  int i,j;
  if(a.n>b.n) i=a.n;
  else i=b.n;
  temp.elts=(char *)malloc(i);
  temp.n=0;
  for(i=0;i<a.n;i++)
  {
    ch=a.elts[i];
    for(j=0;j<b.n;j++)
      if(ch==b.elts[j])
	{
	   temp.elts[temp.n]=ch;
	   temp.n++;
	}
  }
  return temp;
}

set complement(set a)
{
  set temp;
  int i,j,found;
  char ch;
  i=s.n-a.n;
  temp.elts=(char *)malloc(i);
  temp.n=0;
  for(i=0;i<s.n;i++)
  {
    ch=s.elts[i];
    found=0;
    for(j=0;j<a.n;j++)
      if(a.elts[j]==ch)
	 found=1;
    if(found==0)
     {
       temp.elts[temp.n]=ch;
       temp.n++;
     }
  }
  return temp;
}

void main()
{
   set a,b,c,t1,t2,t3,ans,t4;
   char ch;
   clrscr();
   printf("\n Enter the no of elts in sample space:");
   scanf("%d",&s.n);
   s.elts=(char *) malloc(s.n);
   printf("\n Enter the no of elts in A:");
   scanf("%d",&a.n);
   printf("\n Enter the no of elts in B:");
   scanf("%d",&b.n);
   printf("\n Enter the no of elts in C:");
   scanf("%d",&c.n);
   if((a.n+b.n+c.n)>3*s.n)
   {
     printf("\n Invalid values");
     getch();
     exit(0);
   }
   a.elts=(char *) malloc(a.n);
   b.elts=(char *) malloc(b.n);
   c.elts=(char *) malloc(c.n);
   getval(s,"S");
   getval(a,"A");
   getval(b,"B");
   getval(c,"C");
   clrscr();
   while(1)
   {
     clrscr();
     printf("\n Menu: \n 1.DeMorgan's Law\
		      \n 2.Associative Law\
		      \n 3.Distributive Law\
		      \n 4.Commutative Law\
		      \n 5.Exit");
     switch((ch=getch()))
     {
       case '1':
	   clrscr();
	   printf("\n DeMorgan's Law:(A^B)~=A~UB~");
	   t1=intersect(a,b);
	   printval(t1,"A^B");
	   t2=complement(t1);
	   printval(t2,"(A^B)~");

	   t1=complement(a);
	   printval(t1,"A~");
	  // t4=complement(a);
	   t2=complement(b);
	   printval(t2,"B~");
	   ans=unionset(t1,t2);
	   printval(ans,"A~UB~");


	   printf("\n DeMorgan's Law:(AUB)~=A~ ^ B~");
	   t1=unionset(a,b);
	   printval(t1,"AUB");
	   ans=complement(t1);
	   printval(t2,"(AUB)~");

	   t1=complement(a);
	   printval(t1,"A~");
	   t2=complement(b);
	   printval(t2,"B~");
	   ans=intersect(t1,t2);
	   printval(ans,"A~ ^ B~");
	   break;
       case '2':
	   clrscr();
	   printf("\n Associative Law:(A^B)^C = A^(B^C)");
	   t1=intersect(a,b);
	   printval(t1,"A^B");
	   t2=intersect(t1,c);
	   printval(t2,"(A^B)^C");

	   t1=intersect(b,c);
	   printval(t1,"B^C");
	   t2=intersect(t1,a);
	   printval(t2,"A^(B^C)");

	   printf("\n Associative Law:(AUB)UC = AU(BUC)");
	   t1=unionset(a,b);
	   printval(t1,"AUB");
	   t2=unionset(t1,c);
	   printval(t2,"(AUB)UC");

	   t1=unionset(b,c);
	   printval(t1,"BUC");
	   t2=unionset(t1,a);
	   printval(t2,"AU(BUC)");
	   break;
       case '3':
	   clrscr();
	   printf("\n Distributive Law:(AUB)^C = (A^C) U (B^C)");
	   t1=unionset(a,b);
	   printval(t1,"AUB");
	   t2=intersect(t1,c);
	   printval(t2,"(AUB)^C");

	   t1=intersect(a,c);
	   printval(t1,"A^C");
	   t2=intersect(b,c);
	   printval(t1,"B^C");
	   ans=unionset(t1,t2);
	   printval(ans,"(A^C)U(B^C)");

	   printf("\n Distributive Law:(A^B)U C=(AUC)^(BUC)");
	   t1=intersect(a,b);
	   printval(t1,"A^B");
	   t2=unionset(t1,c);
	   printval(t2,"(A^B)UC");

	   t1=unionset(a,c);
	   printval(t1,"AUC");
	   t2=unionset(b,c);
	   printval(t2,"BUC");
	   t2=intersect(t1,t2);
	   printval(t2,"(AUC)^(BUC)");
	   break;
       case '4':
	   printf("\n Commutative Law: AUB=BUA");
	   t1=unionset(a,b);
	   printval(t1,"AUB");
	   t1=unionset(b,a);
	   printval(t1,"BUA");

	   printf("\n Commutative Law: A^B=B^A");
	   t1=intersect(a,b);
	   printval(t1,"A^B");
	   t1=intersect(b,a);
	   printval(t1,"B^A");
	   break;
       case '5':
	   exit(0);
       default:
	   putch('\a');
     }
     putch('\n');
     printval(s,"S");
     printval(a,"A");
     printval(b,"B");
     printval(c,"C");
     getch();
   }
}