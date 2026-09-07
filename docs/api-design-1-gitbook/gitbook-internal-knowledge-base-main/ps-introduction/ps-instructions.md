---
description: The basic rules to follow
---

# Team Guidelines for Task Implementation

Follow these seven essential rules to ensure efficient project execution and high-quality deliverables for task assignment, implementation, testing, and release.

***

### Rule #1: Task Assignment via Smartsheet

* **Requirement:** Every task must be assigned to you in Smartsheet before you begin work.
* **Process:**
  * Project Managers (PMs) are responsible for assigning tasks in Smartsheet.
  * If a PM is unavailable (e.g., only reachable by phone), contact Kostia to create the task in Smartsheet.
* **Key Point:** Do not start any task without an official Smartsheet assignment.

***

### Rule #2: Fully Understand the Task

* **Requirement:** Ensure you have a complete understanding of the task before starting.
* **Steps if the Task is Unclear:**
  * Contact your PM to discuss and request additional details.
  * Ask the PM to update the task description in Smartsheet if needed.
  * Track all such discussions under “Project Management” in Smartsheet.
* **Key Questions to Answer:**
  * What is the purpose of the task, and why are we implementing it?
  * Is there an estimation, and is it sufficient to complete the task?
  * Is the customer in production? Where should the work be done, and how will the solution be tested?
  * For tasks involving UI (e.g., landing pages), do you have a solid design and correct image sizes? (Note: Customers often ask about this later.)
  * If copying elements (e.g., a homepage), verify they function correctly. Report any unexpected bugs to the PM.

***

### Rule #3: Follow the Code Style Guide

* **Requirement:** Write clean, maintainable code that adheres to team standards for easy support by others.
* **Resources:**
  * JavaScript Conventions: [w3schools.com/js/js\_conventions.asp](https://www.w3schools.com/js/js_conventions.asp)
  * HTML5 Syntax: [w3schools.com/html/html5\_syntax.asp](https://www.w3schools.com/html/html5_syntax.asp)
* **Note:** Additional guidelines will be provided once code review processes are fully implemented.

***

### Rule #4: Test Your Solution

* **Requirement:** Thoroughly test your solution after implementation.
* **Process:**
  * Conduct your own testing first.
  * Optionally, ask a teammate to perform additional testing for validation.

***

### Rule #5: Specific Testing for Custom UI Tasks

For tasks involving Custom Headers, Homepages, UI elements, or Custom Forms, follow these testing guidelines:

* Verify that you’ve added a favicon, page title, and prepared the correct configuration file.
* Ensure data validation: The UI should never display `null`, `NaN`, or `undefined`.
* If using new icons or fonts, check if they’re uploaded to `storage.pepperi.com`. If not, send them to Kostia for upload.
* For background or general images, download them from Deposit Photos if needed.
* Test responsiveness across devices (laptop, Android, iPad) and screen sizes (large screens, mobile landscape/portrait, tablet).
* Avoid cache issues by performing final tests in incognito mode.
* If you notice issues outside the task scope that could be improved, discuss with the PM. Your ideas are valued, but confirm if they’re necessary or billable.
* Ensure new changes don’t break existing functionality—check everything during the final test.
* Verify that all buttons work correctly, can be clicked multiple times, and don’t cause errors.

***

### Rule #6: Release the Final Solution

* **Process:**
  1. Once you believe the task is complete, request a code review from Kostia or Oleg.
  2. After the code review, set the Smartsheet task status to **“Ready for Review”** and release the solution to the PM.
* **Code Review Checklist:**
  * Remove all `console.log` statements; use a debugger instead.
  * Eliminate unnecessary calculations.
  * Optimize performance where possible.
  * Store all global variables in a single `config` object; avoid scattered global variables.
  * Use meaningful variable names (e.g., avoid `arr`, `obj`, `objArr`, `test`, etc.).
  * Leverage modern JavaScript features when feasible, except in calc fields for custom forms (verify compatibility).

***

### Rule #7: Share Code with the Team

* **Requirement:** Use the team’s designated code-sharing platform to share final code.
* **Applicable Tasks:**
  * Custom Headers
  * Custom Homepages
  * Add-ons
  * Specific Custom Forms
* **Purpose:** Ensures code is accessible and maintainable by the team.

***

### Final Notes

* Always clarify task details with your PM to avoid misunderstandings.
* Test rigorously to deliver high-quality solutions.
* Use code reviews and the team’s code-sharing platform to maintain consistency and collaboration.
* Your proactive ideas for improvements are appreciated—discuss them with the PM to align with project goals.
