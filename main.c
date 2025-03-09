#include <stdio.h>

extern size_t ft_strlen(const char *str);  // Declaration of the assembly function

int main() {
    // Test strings
    char *str1 = "1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";
    char *str2 = "42 is amazing!";

    // Calling the assembly function ft_strlen
    size_t len1 = ft_strlen(str1);
    size_t len2 = ft_strlen(str2);

    // Printing the results
    printf("Length of string 1: %zu\n", len1);  // Expected: 17
    printf("Length of string 2: %zu\n", len2);  // Expected: 17

    return 0;
}
