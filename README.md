## **MovieQuiz**

MovieQuiz is an app featuring quizzes about movies from the top 250 and the most popular films according to IMDb.

## **Links**

[Figma Design](https://www.figma.com/file/l0IMG3Eys35fUrbvArtwsR/YP-Quiz?node-id=34%3A243)

[API IMDb](https://imdb-api.com/api#Top250Movies-header)

[Fonts](https://code.s3.yandex.net/Mobile/iOS/Fonts/MovieQuizFonts.zip)

## **App Description**

- A single-page application featuring quizzes about movies from the top 250 and the most popular IMDb films. The user answers questions about the movie's rating in sequence. After each round, the app displays statistics on the number of correct answers and the user's best results. The goal is to answer all 10 questions of the round correctly.

## **Functional Requirements**

- When the app starts, a splash screen is displayed;
- After launching, the app shows a question screen with a question text, an image, and two answer options: "Yes" and "No", only one of which is correct;
- The quiz question is based on the IMDb rating of the movie on a 10-point scale, e.g., "Is the rating of this movie higher than 6?";
- The user can select one of the answer options and receive feedback on whether it is correct, with the photo's border changing color accordingly;
- After selecting an answer, the next question automatically appears after 1 second;
- After completing a round of 10 questions, an alert appears with the user's statistics and the option to play again;
- The statistics include: the current round's result (the number of correct answers out of 10 questions), the number of quizzes played, the record (best round result during the session, date and time of that round), and the overall quiz performance in percentage (average accuracy);
- The user can start a new round by pressing the "Play Again" button on the alert;
- If data cannot be loaded, the user sees an alert with a message indicating that something went wrong, along with a button to retry the network request.

## **Technical Requirements**

- The app should support iPhone devices running iOS 15, with only portrait mode available;
- UI elements adapt to the screen resolutions of iPhones starting from the X model — layouts for SE and iPad are not provided;
- The screens match the design — correct fonts of the required sizes are used, all text is positioned correctly, and the placement of all elements, button sizes, and margins are exactly as in the design.
