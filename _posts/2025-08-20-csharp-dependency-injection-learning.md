---
layout: post
title: "Code to Understand C# Dependency Injection"
categories: development
tags: C#, dependency injection, console app, learning
---

Quick planning post to write code to understand the C# dependency injection magic.

Plan is to:

1. Write a library with one function that reverses a string
2. Write a console app that takes a string and applies the injected transformation on it
3. Use the dependency injection framework to inject the function reverse method into it
4. Write another function that capitalises the string
5. Change the dependency injection to use the capitalisation

This hands-on approach should demonstrate how DI works by building a simple string transformation pipeline where the specific transformation can be swapped out via dependency injection.

The example will use [Microsoft.Extensions.DependencyInjection](https://docs.microsoft.com/en-us/dotnet/core/extensions/dependency-injection) - the standard DI container for .NET applications.