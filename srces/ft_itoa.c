/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pdeson <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/26 09:35:40 by pdeson            #+#    #+#             */
/*   Updated: 2023/10/26 16:42:18 by pdeson           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_cptchar(int nb)
{
	int	result;

	result = 1;
	if (nb == -2147483648)
		return (11);
	if (nb < 0)
	{
		result = 2;
		nb = -nb;
	}
	while (nb >= 10)
	{
		nb = nb / 10;
		result = result +1;
	}
	return (result);
}

char	*ft_itoa(int n)
{
	char	*str;
	size_t	length;
	size_t	i;

	if (n == -2147483648)
		return (ft_strdup("-2147483648"));
	length = ft_cptchar(n);
	str = malloc(((length + 1)) * sizeof(char));
	if (!str)
		return (NULL);
	i = 0;
	if (n < 0)
	{
		str[i++] = '-';
		n = -n;
	}
	if (n == 0)
		str[0] = '0';
	str[length] = '\0';
	while (n > 0 && length > 0)
	{
		str[--length] = '0' + (n % 10);
		n = (n / 10);
	}
	return (str);
}
