#include "../includes/libasm_bonus.h"

t_list	*ft_create_elem(void *data)
{
	t_list *tmp;

	tmp = malloc(sizeof(t_list));
	if (tmp)
	{
		tmp->data = data;
		tmp->next = NULL;
	}
	return (tmp);
}

int*
create_data_elem(int data)
{
	int *data_ptr = malloc(sizeof(int));
	if (data_ptr == NULL)
		return (NULL);
	*data_ptr = data;
	return data_ptr;
}

t_list*
create_elem(int data)
{
	t_list *new = malloc(sizeof(t_list));
	if (new == NULL)
		return NULL;
	if ((new->data = create_data_elem(data)) == NULL)
		return (NULL);
	new->next = NULL;
	return new;
}

static void
push_front(t_list **lst_ptr, t_list *new_front)
{
	if (lst_ptr == NULL || new_front == NULL)
		return ;
	new_front->next = *lst_ptr;
	*lst_ptr = new_front;
}

static t_list*
reverse(t_list *list)
{
	if (list == NULL || list->next == NULL)
		return list;
	t_list *tmp = reverse(list->next);
	list->next->next = list;
	list->next = NULL;
	return tmp;
}

t_list*
list_from_format(char *fmt)
{
	t_list *head = NULL;

	while (fmt != NULL && *fmt)
	{
		int n = (int)strtol(fmt, &fmt, 10);
		t_list *elem = create_elem(n);
		push_front(&head, elem);
	}
	return reverse(head);
}

static void    printf_list(t_list *list)
{
    t_list *tmp;

    tmp = list;
	while (tmp)
	{
		printf("%s\n", tmp->data);
		tmp = tmp->next;
	}
}

int main()
{
    t_list *list;
    static int i0 = 0;

    list = list_from_format("");
    printf("%d\n", ft_list_size(list));
    ft_list_remove_if(&list, &i0, strcmp, free);
}