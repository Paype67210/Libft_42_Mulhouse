/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strdup.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pdeson <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/10/16 12:50:47 by pdeson            #+#    #+#             */
/*   Updated: 2023/10/16 13:11:36 by pdeson           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strdup(const char *s)
{
	size_t	i;
	char	*buffer;
	int		len;

	len = ft_strlen(s) + 1;
	buffer = (char *)malloc(len);
	if (buffer == NULL)
		return (0);
	i = 0;
	while (s[i])
	{
		buffer[i] = ((char *)s)[i];
		i++;
	}
	buffer[i] = '\0';
	return (buffer);
}
