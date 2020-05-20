#include "includes/libasm.h"

void    printf_list(t_list *list)
{
	while (list)
	{
		printf("%s\n", list->data);
		list = list->next;
	}
}

int main()
{
    t_list *list;

    bzero(list, sizeof(t_list));
    list->data = "1";
    ft_list_push_front(&list, "2");
    //ft_list_push_front(&list, "2");
    //printf("%d\n", ft_list_size(list));
    printf_list(list);
    
    printf("\n");
    //printf("%d\n", strcmp(list->data, list->next->data));
    printf("%d\n", ft_list_sort(&list, ft_strcmp));
    printf_list(list);
    return (0);
}
