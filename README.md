# Notr

Notr is a note-taking app developed using Flutter and Dart. It follows the principles of clean architecture and utilizes various libraries such as `flutter_bloc`, `get_it`, `floor`, and `auto_route`.

## Features

- Create, edit, and delete notes
- Categorize notes with labels or tags
- Search notes based on title or content
- Mark notes as favorites
- Dark mode support

## Screenshots

<img src="https://github.com/rainman-tech/notr/blob/main/screenshots/Screenshot_1685940114.png" width="250"> <img src="https://github.com/rainman-tech/notr/blob/main/screenshots/Screenshot_1685940117.png" width="250">
<img src="https://github.com/rainman-tech/notr/blob/main/screenshots/Screenshot_1685940120.png" width="250"> <img src="https://github.com/rainman-tech/notr/blob/main/screenshots/Screenshot_1685940124.png" width="250">
<img src="https://github.com/rainman-tech/notr/blob/main/screenshots/Screenshot_1685940128.png" width="250"> <img src="https://github.com/rainman-tech/notr/blob/main/screenshots/Screenshot_1685940132.png" width="250">
<img src="https://github.com/rainman-tech/notr/blob/main/screenshots/Screenshot_1685940134.png" width="250">

#### Check out the figma file here:
https://www.figma.com/file/CcT7ylzzzCcd0n11l8vyUa/Notr?type=design&node-id=0%3A1&t=Fet44RRrDoAlQz4f-1

## Architecture

The Notr project follows the principles of clean architecture. It is organized into the following layers:

- **Presentation**: Contains the user interface and presentation logic. It uses `flutter_bloc` for managing state and `auto_route` for navigation.
- **Domain**: Contains the core business logic and domain models. It is independent of any external frameworks or libraries.
- **Data**: Contains the implementation of data sources and repositories. It uses `floor` as the local database solution.

## Libraries Used

The following libraries were used in the development of the Notr app:

1. `flutter_bloc`: State management library for Flutter applications.
2. `get_it`: Dependency injection container for Flutter and Dart.
3. `floor`: Object-relational mapping (ORM) library for Flutter and Dart.
4. `auto_route`: Code generation library for Flutter navigation.

For more information about these libraries, refer to their respective documentation.

## Contact

For any questions or inquiries, please contact the project maintainer:

Reyn Flores

Email: ramflores462@gmail.com
