#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>  // to check if the syscalls return same errno as the orginal syscalls
                    // stores error codes set by system calls

extern size_t          ft_strlen(const char *s);
extern char            *ft_strcpy(char *dest, const char *src);
extern int             ft_strcmp(const char *s1, const char *s2);
extern ssize_t         ft_read(int fd, void *buf, size_t count);
extern ssize_t         ft_write(int fd, const void *buf, size_t count);
extern char            *ft_strdup(const char *s);

void	strlen_test()
{

	printf("--------------ft_strlen---------------\n\n");

	char *str1 = "123456789";
	char *str2 = "asdfasdfasdfasdf";
	char *str3 = "";
	char *str4 = "------------------9------------------sdfsfsdfsfasdfasdf---------------asdfasdf";

	printf("strlen is \t [%ld] \nft_strlen is \t [%ld]\n\n", strlen(str1), ft_strlen(str1));
	printf("strlen is \t [%ld] \nft_strlen is \t [%ld]\n\n", strlen(str2), ft_strlen(str2));
	printf("strlen is \t [%ld] \nft_strlen is \t [%ld]\n\n", strlen(str3), ft_strlen(str3));
	printf("strlen is \t [%ld] \nft_strlen is \t [%ld]\n\n", strlen(str4), ft_strlen(str4));
}

void		strcpy_test()
{
	printf("\n--------------ft_strcpy---------------\n\n");

	char	dst_two[250];

	char *str1 = "123456789";
	char *str2 = "asdfasdfasdfasdf";
	char *str3 = "";
	char *str4 = "------------------9------------------sdfsfsdfsfasdfasdf---------------asdfasdf";
	char *str5 = "this is a very looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong string to test a function";

	printf("strcpy is \t [%s] \nft_strcpy is \t [%s]\n\n", strcpy(dst_two, str1), ft_strcpy(dst_two, str1));
	printf("strcpy is \t [%s] \nft_strcpy is \t [%s]\n\n", strcpy(dst_two, str2), ft_strcpy(dst_two, str2));
	printf("strcpy is \t [%s] \nft_strcpy is \t [%s]\n\n", strcpy(dst_two, str3), ft_strcpy(dst_two, str3));
	printf("strcpy is \t [%s] \nft_strcpy is \t [%s]\n\n", strcpy(dst_two, str4), ft_strcpy(dst_two, str4));
	printf("strcpy is \t [%s] \nft_strcpy is \t [%s]\n\n", strcpy(dst_two, str5), ft_strcpy(dst_two, str5));
}

void	strcmp_test()
{
	printf("\n--------------ft_strcmp---------------\n\n");

	char *str1 = "6666123456789";
	char *str2 = "6666asdfasdfasdfasdf";
	char *str3 = "";
	char *str4 = "------------------9------------------sdfsfsdfsfasdfasdf---------------asdfasdf";
	char *str5 = "------------------9------------------sdfsfsdfsfasdfasdf---------------asdfasdf";

	printf("strcmp is \t [%d] \t ft_strcmp is \t [%d]\n", strcmp(str1, str2), ft_strcmp(str1, str2));
	printf("strcmp is \t [%d] \t ft_strcmp is \t [%d]\n", strcmp(str2, str3), ft_strcmp(str2, str3));
	printf("strcmp is \t [%d] \t ft_strcmp is \t [%d]\n", strcmp(str3, str4), ft_strcmp(str3, str4));
	printf("strcmp is \t [%d] \t ft_strcmp is \t [%d]\n", strcmp(str4, str3), ft_strcmp(str4, str3));
	printf("strcmp is \t [%d] \t ft_strcmp is \t [%d]\n", strcmp(str3, str2), ft_strcmp(str3, str2));
	printf("strcmp is \t [%d] \t ft_strcmp is \t [%d]\n", strcmp(str2, str1), ft_strcmp(str2, str1));
	printf("strcmp is \t [%d] \t ft_strcmp is \t [%d]\n", strcmp(str1, str1), ft_strcmp(str1, str1));
	printf("strcmp is \t [%d] \t ft_strcmp is \t [%d]\n", strcmp(str2, str2), ft_strcmp(str2, str2));
	printf("strcmp is \t [%d] \t ft_strcmp is \t [%d]\n", strcmp(str3, str3), ft_strcmp(str3, str3));
	printf("strcmp is \t [%d] \t ft_strcmp is \t [%d]\n", strcmp(str4, str4), ft_strcmp(str4, str4));
	printf("strcmp is \t [%d] \t ft_strcmp is \t [%d]\n", strcmp(str4, str5), ft_strcmp(str4, str5));
}

void read_test(void)
{
    printf("\n--------------ft_read---------------\n\n");

    char *file1 = "test.txt";
    char buf1[500];
    char buf2[500];
    bzero(buf1, sizeof(buf1));
    bzero(buf2, sizeof(buf2));

    int fd1 = open(file1, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (fd1 == -1) {
        perror("Error creating file");
        return;
    }
    ft_write(fd1, "Hello, this is a test file.\n", 28);
    close(fd1);

    fd1 = open(file1, O_RDONLY);
    int fd2 = -1;

    errno = 0;
    printf("read() return value \t [%zd]\n", read(fd1, buf1, 40));
    printf("read() read buf \t %s\n", buf1);
    printf("read() errno \t\t [%d] \t [%s]\n", errno, strerror(errno));
    
    errno = 0;
    close(fd1);
    fd1 = open(file1, O_RDONLY);
    printf("ft_read() return value \t [%zd]\n", ft_read(fd1, buf1, 40));
    printf("ft_read() read buf \t %s\n", buf1);
    printf("ft_read() errno \t [%d] \t [%s]\n", errno, strerror(errno));

    printf("\n");

    errno = 0;
    printf("read() return value \t [%zd]\n", read(fd2, buf2, 40));
    printf("read() read buf \t [%s]\n", buf2);
    printf("read() errno \t\t [%d] \t [%s]\n", errno, strerror(errno));

    errno = 0;
    printf("ft_read() return value \t [%zd]\n", ft_read(fd2, buf2, 40));
    printf("ft_read() read buf \t [%s]\n", buf2);
    printf("ft_read() errno \t [%d] \t [%s]\n", errno, strerror(errno));

    close(fd1);
    close(fd2);
    unlink(file1); // Delete the file
}

void	write_test()
{
	printf("\n--------------ft_write---------------\n\n");
	char *buf = "TEST SENTENCE TO TEST WRITE.\n";
	int fd = 1;
	int n = strlen(buf);
	errno = 0;
	printf("write() return value \t\t [%zd]\n", write(fd, buf, n));
	printf("ft_write() return value \t [%zd]\n", ft_write(fd, buf, n));
	printf("\n");

	errno = 0;
	printf("write() return value \t\t [%d]\n", -1); // NULL buffer test
	printf("write() errno \t\t\t [%d] \t [%s]\n", 14, "Bad address");
	printf("\n");
	errno = 0;
	printf("ft_write() return value \t [%zd]\n", ft_write(fd, NULL, n)); // NULL buffer test
	printf("ft_write() errno \t\t [%d] \t [%s]\n", errno, strerror(errno));
	printf("\n");

	errno = 0;
	printf("write() return value \t\t [%zd]\n", write(-1, buf, n)); // Invalid fd test
	printf("write() errno \t\t\t [%d] \t [%s]\n", errno, strerror(errno));
	printf("\n");

	errno = 0;
	printf("ft_write() return value \t [%zd]\n", ft_write(-1, buf, n)); // Invalid fd test
	printf("ft_write() errno \t\t [%d] \t [%s]\n", errno, strerror(errno));
	printf("\n");
}

void ft_strdup_test(void)
{
    printf("\n--------------ft_strdup---------------\n\n");

    char *str1 = strdup("test1");
    char *ft_str1 = ft_strdup("test1");
    printf("strdup \t\t [%s]\n", str1);
    printf("ft_strdup \t [%s]\n", ft_str1);
    free(str1);
    free(ft_str1);
    printf("\n\n");

    char *str2 = strdup("this is a very looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong string to test a function");
    char *ft_str2 = ft_strdup("this is a very looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong string to test a function");
    printf("strdup \t\t [%s]\n", str2);
    printf("ft_strdup \t [%s]\n", ft_str2);
    free(str2);
    free(ft_str2);
    printf("\n\n");

    char *str3 = strdup("");
    char *ft_str3 = ft_strdup("");
    printf("strdup \t\t [%s]\n", str3);
    printf("ft_strdup \t [%s]\n", ft_str3);
    free(str3);
    free(ft_str3);
}

int 	main(void)
{
	strlen_test();
	strcpy_test();
	strcmp_test();
	read_test();
	write_test();
	ft_strdup_test();
	return 0;
}
