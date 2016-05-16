/*THIS PROGRAM IS DONE BY  RAMMOHAN REDDY(04MZ10) AND JEEVAN FENN VARUGHESE
(04MZ32).

************************* PRISONER DILEMMA*********************************
*/
#include<stdlib.h>
#include<stdio.h>
#include<conio.h>

int calculate(int*);
int* select(int *);
void crossover(int*,int*);
void sort_select(void);
//THESE ARE SOME GLOBAL VARIABLE USED
int best_score[20];
int score[9];
int index[6];


void main()
{
	int a[10][70],select_string[5][70];
	int best_string[20][70],max,ind=0;
	int p,counter=1;
	int i,n,j,temp[10];
	randomize();
	clrscr();
	for(j=0;j<10;j++)
	for(i=0;i<70;i++)
		a[j][i]=random(2);
	//THE NUMBER OF GENERATION TO BE SCANED IN
	printf(" Enter the no of generation ");
	scanf("%d",&n);
	for(i=0;i<10;i++)
		score[i]=calculate(&a[i][0]);
	//FUNCTION FOR SORTING THE SCORE ARRAY AND FINDING THE INDEX OF BEST SCORE
	sort_select();
	for(i=0;i<7;i++)
	{
		p=index[i];//THE ORDER OF BEST SCORE STORED IN INDEX.
		for(j=0;j<70;j++)
			select_string[i][j]=a[p][j];
	}
	best_score[0]=score[0];
	for(i=0;i<70;i++)
		best_string[0][i]=select_string[0][i];

	while(counter < n)
	{
		for(i=0;i<7;i=i+2)
			crossover(&a[i][0],&a[i+1][0]);
			for(i=0;i<9;i++)
				score[i]=0;
				for(i=0;i<7;i++)
				score[i]=calculate(&a[i][0]);
		     //CALCULATE FUNCTION RETURNS SCORE OF EACH STRING
				sort_select();
				best_score[counter]=score[0];
				p=index[0];
			for(j=0;j<70;j++)
				best_string[counter][j]=a[p][j];
			counter++;
	}

	//OUTPUT THE BEST SCORES.
	for(p=0;p<n;p++)
	{
		printf("The best score in the generation %d :",p+1);
		printf(" %d \n", best_score[p]);
	}
	//OUTPUT THE BEST STRINGS.
	for(i=0;i<n;i++)
	{
		printf("\n\nTHE BEST STRNG IN GENERATION %d :\n\n",i+1);
		for(j=0;j<70;j++)
		{
			if(j%2==0&&j!=0)
			printf(" ");
			if(best_string[i][j] ==1)
				printf("d");
			//COVERTING 1'S AND 0'S TO d AND c
			else
				printf("c");

		 }
	}

 //CALCULATING THE BEST OF THE BEST
	for(i=0;i<n;i++)
		temp[i]=best_score[i];
	max=temp[0];
	for(i=1;i<n;i++)
	{
		if(max<temp[i])
		{
			max=temp[i];
			ind=i;
		 }
	 }
  //CALCULATING THE BEST FROM THE SELECTED.
	 printf("\n\n");
	 printf("\nTHE BEST STRING IN ALL GENERATION IS \n\n");
	 for(i=0;i<70;i++)
	 {
		 if(i%2==0&&i!=0)
		 printf(" ");
		 if(best_string[ind][i]==1)
			 printf("d");
		 else
		 printf("c");
	 }
		 printf("\n\nTHE CORRESPONDING BEST SCORE IS:  %d   ",best_score[ind]);
		 getch();
}



int calculate(int* ptr)
{
	int *a;
	int p1,p2,i;
	a=ptr;
	p1=0; p2=0;
	for(i=0;i<70;i=i+2)  //CALCULATING THE VALUES ACCORDING TO TRUTH TABLE.
	{
		if(a[i]==1 && a[i+1]==1)
		{
			 p1=p1+3; p2=p2+3;
		}
		if(a[i]==1 && a[i+1]==0)
		{
			  p1=p1+5; p2=p2+0;
		}
		if(a[i]==0 && a[i+1]==1)
		{
			p1=p1+0; p2=p2+5;
		}
		if(a[i]==0 && a[i+1]==0)
		{
			p1=p1+1; p2=p2+1;
		}
	 }
	 return(p1+p2); //RETRUN THE TOTAL SCORE OF THE STRING.
}






void sort_select()     //ORDINARY SORTING PROCEDURE
{
	 int temp[9],i,j,t;
	 for(i=0;i<10;i++)
	 temp[i]=score[i];

	 for(i=0;i<10;i++)
		 for(j=9;j>=i;j--)
		 {
			 if(temp[i]<temp[j]) //USUSAL SWAPPING PROCEDURE.
			  {
				  t=temp[j];
				  temp[j]=temp[i];
				  temp[i]=t;
			  }
		 }

	  for(i=0;i<7;i++)
	  for(j=0;j<10;j++)
		  if(temp[i]==score[j])
			 index[i]=j;
		  score[0]=temp[0];
 }



void crossover(int *ptr1,int *ptr2)
{
	int temp,i,j;
	int ind=random(60);     //RANDOM POINT OF CROSSOVER

	for(i=ind;i<70;i++)
	{
		temp=ptr1[i];
		ptr1[i]=ptr2[i];
		ptr2[i]=temp;
	}
}
