# dexterstt

A speech to text app with an always-listening service

## Task

1. Implement the UI Screen from the [Figma Design](https://www.figma.com/file/fkdwc6mGC4QdkrB5JlE2FU/Flutter-Assignment-UI?type=design&node-id=0-1&mode=design)
2. Add "always-listening" mode for native Android in Kotlin"
3. Write tests for the Kotlin code
3. Create the Flutter app with the desired feature and architecture
5. Optional: write a small README () with some explanation

Alternative Task: (if you cannot do the Kotlin task)
- Implement the always-listening mode in Flutter instead of Kotlin. You are allowed to use Flutter packages for this. So the task is the same but you are free to use whatever you want in order to implement the functionality.
- The flutter code should still use BloC and Clean Architecture.

(Alloted Time: 4 hours)

## Approach

I decided to go with the alternative task due to time constraints. If I'll manage to spare some time I'll pick up on the native approach on the [refactor/native](https://github.com/kimathi-phil/dexterstt/tree/refactor/native) branch

---
The different tasks undertaken can be referenced from the other project branches:
- [feat/layout](https://github.com/kimathi-phil/dexterstt/tree/feat/layout) branch: For layout related tasks (design work, state management)
- [feat/data-layer](https://github.com/kimathi-phil/dexterstt/tree/feat/data-layer) branch: For data related tasks (network calls, data persistence, recorder)
- [feat/business-logic](https://github.com/kimathi-phil/dexterstt/tree/feat/business-logic) branch: For all the project's business logic (contracts, entities, usecases)
- [ci](https://github.com/kimathi-phil/dexterstt/tree/ci) branch: For CI/CD related tasks

#### Pending tasks

- [ ] Refactor audio listening natively using .kt and platform channels
- [ ] Refine persistence layer (noticed some strange behavior with the data structures I used for persistence)
- [ ] Improvements on state management
- [ ] Better error handling
- [ ] Tests
- [ ] CI/CD


---
## Installation & Setup
Clone the repo to your local machine  
```git
git clone https://github.com/kimathi-phil/dexterstt.git
```

Navigate to the project folder  
```sh
cd dexterstt
```

Get Packages:

```sh
$ flutter pub get
```

Generate code-gen for the project 
```sh
dart run build_runner build --delete-conflicting-outputs
```

Run the project:

```sh
$ flutter run
```
---

[APK Download](https://github.com/kimathi-phil/dexterstt/blob/main/dexterstt.apk)