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
    list->data = "primero puse esto";
    ft_list_push_front(&list, "pero despues esto y ahora va al principio");
    ft_list_push_front(&list, "ahora yo soy el primero, jajota jajota");
    printf("%d\n", ft_list_size(list));
    printf_list(list);
    return (0);
}
