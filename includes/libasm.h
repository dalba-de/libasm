/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marvin <marvin@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/04/26 10:35:50 by marvin            #+#    #+#             */
/*   Updated: 2020/04/26 10:35:50 by marvin           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <stdlib.h>
# include <stdio.h>
# include <string.h>
# include <unistd.h>
# include <fcntl.h>

size_t  ft_strlen(const char *s);
int     ft_strcmp(const char *s1, const char *s2);
char	*ft_strcpy(char *dst, const char *src);
char    *ft_strdup(const char *s);
int     ft_atoi_base(char *str, char *base);
int	    ft_check_base(char c, char *base);
int     ft_pow(int nbr, int base);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);

#endif

