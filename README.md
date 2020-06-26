# Libasm

Assembly Yourself!

### Parte obligatoria

Escribir las siguientes funciones en la notación ASM de 64 bits en la sintaxis de Intel:

```
size_t		ft_strlen(const char *str);
int		ft_strcmp(const char *str1, const char *str2);
char		*ft_strcpy(char *dst, const char *src);
char		*ft_strdup(const char *s);
ssize_t		ft_write(int fd, const void *buf, size_t count);
ssize_t		ft_read(int fd, void *buf, size_t count);
```

### Parte Bonus

Con la siguiente estructura:

```
typedef struct		s_list
{
	void		*data;
	struct s_list	*next;
}			t_list;
```

Escribir las siguientes funciones:

```
int		ft_atoi_base(char *str, char *base);
ssize_t		ft_write(int fd, const void *buf, size_t count);
ssize_t		ft_read(int fd, void *buf, size_t count);
void		ft_list_push_front(t_list **begin_list, void *data);
int		ft_list_size(t_list *begin_list);
void		ft_list_sort(t_list **begin_list, int (*cmp)());
void		ft_list_remove_if(t_list **begin_list, void*data_ref,
				int(*cmp)(), void(*free_fct)(void*));
```

### Recursos
* [Guía de programación del IA-32 en sintaxis AT&T](http://people.ac.upc.es/guerrero/fo/asm.pdf)
* [Programación en ensamblador (x86-64)](http://cv.uoc.edu/annotation/8255a8c320f60c2bfd6c9f2ce11b2e7f/619469/PID_00218273/PID_00218273.html)
* [NAMS Tutorial](https://cs.lmu.edu/~ray/notes/nasmtutorial/)
* [Return errno in Assembly](https://stackoverflow.com/questions/15304829/how-to-return-errno-in-assembly)
* [Print errno message in Assembly](https://stackoverflow.com/questions/28922572/how-to-print-error-message-using-errno-in-assembly-language/28952085)
