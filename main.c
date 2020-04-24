#include "includes/libasm.h"

void    ft_putchar(char c)
{
    ft_write(1, &c, 1);
}

void    ft_putstr(char *str)
{
    int i;

    i = 0;
    while (str[i])
    {
        ft_putchar(str[i]);
        i++;
    }
}

int main()
{
    char    s1[100];
    char    *s2 = "ABCDE";
    char    *s3 = "abcde";
    char    *s4 = "cadena larga de caracteres para volverse locos loquitos";
    int     fd;
    int     r;

    /*printf("strlen ==> %ld\n", strlen(s2));
    printf("ft_strlen ==> %ld\n", ft_strlen(s2));
    printf("strcmp ==> %d\n", strcmp(s2, s3));
    printf("ft_strcmp ==> %d\n", ft_strcmp(s2, s3));
    printf("strcpy ==> %s\n", strcpy(s1, s2));
    printf("ft_strcpy ==> %s\n", ft_strcpy(s1, s2));
    printf("strdup ==> %s\n", strdup(s4));
    printf("ft_strdup ==> %s\n", ft_strdup(s4));
    printf("ft_atoi_base ==> %d\n", ft_atoi_base("      -2a", "0123456789abcedf"));
    fd = open("test.txt", O_RDONLY);
    r = ft_read(fd, s1, 11);
    s1[r] = '\0';
    close (fd);
    ft_putstr(s1);*/
    printf("ft_atoi_base ==> %d\n", ft_atoi_base("45", "01"));
    return (0);
}
