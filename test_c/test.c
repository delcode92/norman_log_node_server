#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_NAME_LENGTH 50
#define MAX_EMAIL_LENGTH 100

// Structure to hold user information
typedef struct {
    char name[MAX_NAME_LENGTH];
    int age;
    char email[MAX_EMAIL_LENGTH];
    float height;
    char gender;
} UserProfile;

// Function prototypes
void clearInputBuffer();
int validateEmail(const char *email);
void getUserInput(UserProfile *user);
void displayUserProfile(const UserProfile *user);

int main() {
    UserProfile user;
    char continue_input;

    do {
        // Clear the user structure
        memset(&user, 0, sizeof(UserProfile));

        // Get user input
        getUserInput(&user);

        // Display the entered information
        displayUserProfile(&user);

        // Ask if user wants to enter another profile
        printf("\nDo you want to enter another profile? (y/n): ");
        scanf(" %c", &continue_input);
        clearInputBuffer();

    } while (continue_input == 'y' || continue_input == 'Y');

    return 0;
}

// Function to clear input buffer
void clearInputBuffer() {
    int c;
    while ((c = getchar()) != '\n' && c != EOF);
}

// Basic email validation
int validateEmail(const char *email) {
    // Simple check for '@' and '.' 
    return (strchr(email, '@') != NULL && strchr(email, '.') != NULL);
}

// Get user input with validation
void getUserInput(UserProfile *user) {
    // Name input
    while (1) {
        printf("Enter your full name (max %d chars): ", MAX_NAME_LENGTH - 1);
        if (fgets(user->name, MAX_NAME_LENGTH, stdin) != NULL) {
            // Remove newline if present
            user->name[strcspn(user->name, "\n")] = 0;
            
            // Basic validation: name should not be empty
            if (strlen(user->name) > 0) break;
        }
        printf("Invalid name. Please try again.\n");
    }

    // Age input
    while (1) {
        printf("Enter your age (1-120): ");
        if (scanf("%d", &user->age) == 1 && user->age > 0 && user->age <= 120) {
            clearInputBuffer();
            break;
        }
        clearInputBuffer();
        printf("Invalid age. Please enter a number between 1 and 120.\n");
    }

    // Email input with validation
    while (1) {
        printf("Enter your email address: ");
        if (fgets(user->email, MAX_EMAIL_LENGTH, stdin) != NULL) {
            // Remove newline if present
            user->email[strcspn(user->email, "\n")] = 0;
            
            // Validate email
            if (validateEmail(user->email)) break;
        }
        printf("Invalid email. Please try again.\n");
    }

    // Height input
    while (1) {
        printf("Enter your height in meters (0.5-3.0): ");
        if (scanf("%f", &user->height) == 1 && user->height >= 0.5 && user->height <= 3.0) {
            clearInputBuffer();
            break;
        }
        clearInputBuffer();
        printf("Invalid height. Please enter a number between 0.5 and 3.0.\n");
    }

    // Gender input
    while (1) {
        printf("Enter your gender (M/F/O): ");
        scanf(" %c", &user->gender);
        clearInputBuffer();
        
        // Validate gender input
        if (user->gender == 'M' || user->gender == 'F' || user->gender == 'O') {
            break;
        }
        printf("Invalid gender. Please enter M, F, or O.\n");
    }
}

// Display user profile
void displayUserProfile(const UserProfile *user) {
    printf("\n--- User Profile ---\n");
    printf("Name: %s\n", user->name);
    printf("Age: %d\n", user->age);
    printf("Email: %s\n", user->email);
    printf("Height: %.2f meters\n", user->height);
    printf("Gender: %c\n", user->gender);
}