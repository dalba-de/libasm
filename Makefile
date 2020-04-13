# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dalba <dalba@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/13 16:54:49 by dalba             #+#    #+#              #
#    Updated: 2020/04/13 17:19:01 by dalba            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# COLORS #

# This is a minimal set of ANSI/VT100 color codes
_END		=	\x1b[0m
_BOLD		=	\x1b[1m
_UNDER		=	\x1b[4m
_REV		=	\x1b[7m

# Colors
_GREY		=	\x1b[30m
_RED		=	\x1b[31m
_GREEN		=	\x1b[32m
_YELLOW		=	\x1b[33m
_BLUE		=	\x1b[34m
_PURPLE		=	\x1b[35m
_CYAN		=	\x1b[36m
_WHITE		=	\x1b[37m

# Inverted, i.e. colored backgrounds
_IGREY		=	\x1b[40m
_IRED		=	\x1b[41m
_IGREEN		=	\x1b[42m
_IYELLOW	=	\x1b[43m
_IBLUE		=	\x1b[44m
_IPURPLE	=	\x1b[45m
_ICYAN		=	\x1b[46m
_IWHITE		=	\x1b[47m

# **************************************************************************** #

# MACROS #

NAME = libasm.a

CC = gcc

CFLAGS = -Wall -Werror -Wextra -I./includes

NASM = nasm

NFLAGS = -felf64 -I./includes

AR = ar rc

SRC_DIR = srcs/

INC_DIR = includes/

OBJ_DIR = objects/

SRC =	ft_strcmp.s ft_strlen.s ft_strcpy.s ft_strdup.s \

SRCS = $(addprefix ${SRC_DIR},${SRC})

OBJ = $(addprefix ${OBJ_DIR}, ${SRC:.c=.o})

# **************************************************************************** #

# RULES #

all:		${NAME}

${NAME} :	${OBJ}
			@echo "$(_GREEN) All files compiled. $(_END)✅"
			${AR} ${NAME} ${OBJ}
			ranlib ${NAME}
			@echo "$(_GREEN) Library '$(NAME)' compiled. $(_END)✅"

${OBJ_DIR}%.o: ${SRC_DIR}%.s
			mkdir -p ${OBJ_DIR}
			${NASM} ${NFLAGS} -o $@ -s $<

clean:
			rm -rf ${OBJ_DIR}
			@echo "$(_RED)'"$(DIR_OBJS)"' has been deleted. $(_END)🗑️"


fclean:		clean
			@rm -f ${NAME}
			@echo "$(_RED)'"$(NAME)"' has been deleted. $(_END)🗑️"