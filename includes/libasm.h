/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dalba-de <dalba-de@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/04/26 11:04:54 by dalba-de          #+#    #+#             */
/*   Updated: 2020/05/20 19:11:22 by dalba-de         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <stdlib.h>
# include <stdio.h>
# include <string.h>
# include <fcntl.h>
# include <unistd.h>
# include <errno.h>

typedef struct		s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

size_t				ft_strlen(const char *s);
int					ft_strcmp(const char *s1, const char *s2);
char				*ft_strcpy(char *dst, const char *src);
char				*ft_strdup(const char *s);
int					ft_atoi_base(char *str, char *base);
int					ft_check_base(char c, char *base);
int					ft_pow(int nbr, int base);
ssize_t				ft_write(int fd, const void *buf, size_t count);
ssize_t				ft_read(int fd, void *buf, size_t count);
void				ft_list_push_front(t_list **begin_list, void *data);
int					ft_list_size(t_list *begin_list);
int				ft_list_sort(t_list **begin_list, int (*cmp)());

#endif
