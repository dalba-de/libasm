#include "../includes/libasm.h"

static int	at_strlen(char *str)
{
	int i;
	int j;

	i = 0;
	j = 0;
	while ((str[i] == ' ') || (str[i] == '-') || (str[i] == '+') || (str[i] >= '\t' && str[i] <= '\r'))
	{
		i++;
		j++;
	}
	while(str[i])
		i++;
	return (i - j);
}

static int	check_error_base(char *base)
{
	int count;
	int i;

	i = 0;
	while (base[i])
	{
		count = i + 1;
		while (base[count])
		{
			if (base[i] == base[count])
				return (0);
			count++;
		}
		i++;
	}
	return (1);
}

static int	ft_check_base(char c, char *base)
{
	int i;

	i = 0;
	while (base[i])
	{
		if (c == base[i])
			return (i);
		i++;
	}
	return (-1);
}

static int	ft_pow(int nbr, int base)
{
	int mult;

	mult = nbr;
	if (base == 0)
		return (1);
	while (base > 1)
	{
		nbr *= mult;
		base--;
	}
	return (nbr);
}

static int	base_long(char *base)
{
	int	i;

	i = 0;
	while (base[i])
		i++;
	return (i);
} 

static int	ft_sign(char str)
{
	if (str == '-' || str == '+')
	{
		if (str == '-')
			return (-1);
	}
	return (1);
}

int         ft_atoi_base(char *str, char *base)
{
	int         i;
	long int    result;
	int         sign;
	int         base_length;
	int			str_length;

	i = 0;
	if (!check_error_base(base))
		return (0);
	while (str[i] == ' ' || (str[i] >= '\t' && str[i] <= '\r'))
		i++;
	sign = ft_sign(str[i]);
	base_length = base_long(base);
	if (base_length <= 1)
		return (0);
	str_length = at_strlen(str) - 1;
	if (str[i] == '-' || str[i] == '+')
		i++;
	result = 0;
	while (str[i])
	{
		if (ft_check_base(str[i], base) == -1)
			return (0);
		result += (ft_check_base(str[i], base) * ft_pow(base_length, str_length));
		i++;
		str_length--;
	}
	return (result * sign);
}

int main()
{
	printf("%d\n", ft_atoi_base("poney", "popne"));
}