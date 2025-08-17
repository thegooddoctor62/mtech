#include<stdio.h>
 int arr[5];
int *ptr=arr ;
void input()
{
   for(int i=0;i<5;i++)
    {
        printf("a[%d] : ",i);
        scanf("%d",ptr+i);
    }
}
void odd_even()
{
    for (int i = 0; i < 5; i++) {
    printf("*(ptr+%d)=%d -> %s\n", i, *(ptr+i), (*(ptr+i) % 2 == 0) ? "Even" : "Odd");
}

}
void sort()
{
    for(int i = 0; i < 4; i++) {
        for(int j = i + 1; j < 5; j++) {
            if(*(ptr + i) > *(ptr + j)) {
                int temp = *(ptr + i);
                *(ptr + i) = *(ptr + j);
                *(ptr + j) = temp;
            }
        }
    }
}
void print_sorted()
{
    printf("\nSorting in Ascending Order\n");
    printf("Sorted Array: [");
    for (int i = 0; i < 5; i++) {
        printf("%d %s", *(ptr + i), (i < 4) ? ", " : "]");
    }
    printf("\n");
}
int  main()
{
  printf("=== Array: Even/Odd & Sort (Using Pointer) ===\n");
  printf("Enter 5 intgers:\n");
  input();
  printf("\nPointer traversal (ptr= &a[0]):\n");
  odd_even();
  sort();
  print_sorted();
}