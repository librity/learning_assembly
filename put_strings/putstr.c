/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   putstr.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lpaulo-m <lpaulo-m@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/05 23:20:43 by lpaulo-m          #+#    #+#             */
/*   Updated: 2022/08/05 23:30:47 by lpaulo-m         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

// gcc -S putstr.c

#include <unistd.h>

static void	putstr(char *str)
{
	size_t	length;

	length = 0;
	while (str[length])
		length++;
	write(STDOUT_FILENO, str, length);
}

int	main(void)
{
	putstr("HELLO IN ASSEMBLY!");
	return (0);
}
