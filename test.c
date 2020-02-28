#	include <stdio.h>
#	include <stdlib.h>
#	include <fcntl.h>
#	include "get_next_line.h"

int	main(int argc, char **argv)
{
	char	*line;
	int		result;
	int		fd;

	if (argc < 2)
		return (0);
	fd = open(argv[argc - 1], O_RDONLY);
	line = NULL;
	while ((result = get_next_line(fd, &line)))
	{
		if (result == -1)
		{
			printf("!!!!GNL_ERROR!!!!\n");
			return (0);
		}
		printf("%s\n", line);
		free(line);
	}
	printf("%s\n", line);
	free(line);
	close(fd);
}