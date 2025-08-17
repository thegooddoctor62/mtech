#include<stdio.h>
#include<math.h>
void menu()
{
        printf("=== Simple Calculator ===\n");
        printf("1) Add (+)\n");
        printf("2) Substraction (-)\n");
        printf("3) Multiply (*)\n");
        printf("4) Division (/)\n");
        printf("5) Modulo (%%)\n");
        printf("6) Power(**)\n");
        printf("0) Exit\n");
}
int choice_selection()
{
        int choice;
        printf("Enter your choice:");
        scanf("%d",&choice);
        if (choice<0||choice>6)
        {printf("Please Enter a Valid Choice");}
        else{return choice;}
        
}
void calculator(int choice,int num1,int num2)
{
    switch(choice)
        {
            case 1:
            printf("%d + %d = %d\n",num1,num2,num1+num2);
            break;
            case 2:
            printf("%d - %d = %d\n",num1,num2,num1-num2);
            break;
            case 3:
            printf("%d * %d = %d\n",num1,num2,num1*num2);
            break;
            case 4:
            if(num2==0)
            {printf("Error : Division by Zero is not allowed\n");}
            else
            {printf("%f / %f = %f\n", (float)num1, (float)num2, (float)num1 / num2);}
            break;
            case 5:
            if(num2==0)
            {printf("Error : Division by Zero is not allowed\n");}
            else
            {printf("%d %% %d = %d\n",num1,num2,num1%num2);}
            break;
            case 6:
            printf("%d ^ %d = %.2f\n",num1,num2,pow(num1,num2));
            break;
            default :
            printf("Error : Please Enter a valid choice\n");
        }
}
int main()
{
    int choice,num1,num2;
    while(1)
    {   menu();
        choice=choice_selection();
        if (choice==0)
        {printf("GoodBye!");
         return 0;
        }
        printf("Enter first number :");
        scanf("%d",&num1);
        printf("Enter second number :");
        scanf("%d",&num2);
        calculator(choice,num1,num2);
    }
}
