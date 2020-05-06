#include "includes/libasm.h"

void    printf_list(t_list *list)
{
	while (list)
	{
		printf("%s\n", list->data);
		list = list->next;
	}
}

void    ft_list_sort(t_list **begin_list, int (*cmp)())
{
	t_list	*aux;
	t_list	*first;
	int		i;

	i = 1;
	while (i)
	{
		i = 0;
		first = *begin_list;
		while (first->next)
		{
			if ((*cmp)(first->data, first->next->data) > 0)
			{
				i = 1;
				aux = first->data;
				first->data = first->next->data;
				first->next->data = aux;
			}
			first = first->next;
		}
	}
}

int main()
{
    t_list *list;

    bzero(list, sizeof(t_list));
    list->data = "A";
    ft_list_push_front(&list, "Z");
    ft_list_push_front(&list, "C");
	printf_list(list);
	printf("\n");
    ft_list_sort(&list, strcmp);
	printf_list(list);
    return (0);
}