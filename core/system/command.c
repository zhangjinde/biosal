
#include "command.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char BSAL_DEFAULT_OUTPUT[] = "output";

int bsal_command_has_argument(int argc, char **argv, const char *argument)
{
    int i;
    char *actual_argument;

    for (i = 0; i < argc; i++) {
        actual_argument = argv[i];

        if (strcmp(actual_argument, argument) == 0) {
            return 1;
        }
    }

    return 0;
}

char *bsal_command_get_argument_value(int argc, char **argv, const char *argument)
{
    int i;
    char *value;

    value = NULL;

    for (i = 0; i < argc; i++) {
        if (strcmp(argv[i], argument) == 0 && i + 1 < argc) {
            value = argv[i + 1];
            break;
        }
    }

    return value;
}


char *bsal_command_get_output_directory(int argc, char **argv)
{
    char *directory_name;
    char *value;

    directory_name = BSAL_DEFAULT_OUTPUT;

    value = bsal_command_get_argument_value(argc, argv, "-o");

    if (value != NULL) {
        value = directory_name;
    }

    return directory_name;
}

int bsal_command_get_kmer_length(int argc, char **argv)
{
    char *value;
    int kmer_length;
    int provided_value;

    kmer_length = BSAL_DEFAULT_KMER_LENGTH;

    value = bsal_command_get_argument_value(argc, argv, "-k");

    if (value != NULL) {
        provided_value = atoi(value);

        /*
         * Use a odd kmer length
         */
        if (provided_value % 2 == 0) {
            ++provided_value;
        }

        kmer_length = provided_value;
    }

    printf("DEBUG kmer_length %d\n", kmer_length);

    return kmer_length;
}
