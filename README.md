# ALICE Security Suite

The ALICE Security Suite (Automated Lightweight Integrated Control Environment) is a web-based administrative tool designed to streamline the management of Active Directory (AD) resources and related IT infrastructure. It provides a user-friendly interface for performing common administrative tasks, such as creating AD groups, managing shared mailboxes, and configuring folder permissions, while leveraging PowerShell scripts for backend automation.

## Features

- **Active Directory Management**:
  - Create and manage AD groups.
  - Perform bulk operations for AD group creation.
  - Query AD objects and permissions.

- **Mailbox Management**:
  - Create shared mailboxes.
  - Rename existing shared mailboxes.

- **Folder Permissions**:
  - View and manage folder permission groups.
  - Identify folder approvers.

- **Server Group Management**:
  - Create server-specific groups (e.g., Local Admins, RDP, Power groups).

- **Resource Calendars**:
  - Create and manage shared resource calendars.

- **Generic Accounts**:
  - Create and manage generic accounts.
  - Perform bulk operations for generic account creation.

## Project Structure

### Key Directories

- **PowerShell scripts/**: Contains PowerShell scripts that perform backend operations, such as creating AD groups, managing mailboxes, and querying permissions.
- **SecuritySuite/**: Contains the ASP.NET web application files, including `.aspx` pages and their corresponding code-behind files.

## Prerequisites

- **Software Requirements**:
  - .NET Framework
  - IIS (Internet Information Services)
  - PowerShell with Quest Active Roles Cmdlets for AD Management

- **Configuration**:
  - Ensure the PowerShell scripts are located in `C:\Scripts\Powershell\`.
  - Update any hardcoded paths in the scripts or code-behind files if necessary.

## How to Build and Run

1. Open the solution file `ALICE.sln` in Visual Studio.
2. Build the project to generate the necessary binaries.
3. Deploy the web application to IIS or run it locally using Visual Studio's built-in web server.
4. Access the application via the configured URL (e.g., `http://localhost:49301/`).

## Usage

1. Navigate to the homepage (`Home.aspx`).
2. Use the provided UI to perform administrative tasks:
   - Click on the relevant icons (e.g., AD Groups, Mailboxes, Server Groups) to access specific features.
   - Fill in the required fields and execute actions.
3. View results and logs directly in the web interface.

## Security Considerations

- Ensure proper authentication and authorization mechanisms are in place to restrict access to the application.
- Validate all user inputs to prevent injection attacks.
- Review and sanitize PowerShell script outputs before displaying them in the UI.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a feature branch.
3. Commit your changes and submit a pull request.

## Author

This solution was created by Kevin Olanday and was tailored for an organizational setting.

## Note on Modernization

This solution is now outdated, and better frameworks and technologies can be used to achieve similar functionality with improved performance, scalability, and maintainability. Consider the following modern alternatives:

- **Frontend**: Use modern frontend frameworks like [React](https://reactjs.org/), [Angular](https://angular.io/), or [Vue.js](https://vuejs.org/) for building dynamic and responsive user interfaces.
- **Backend**: Replace the ASP.NET Web Forms architecture with [ASP.NET Core](https://dotnet.microsoft.com/apps/aspnet) for a more modern, cross-platform, and high-performance backend.
- **Automation**: Leverage modern PowerShell modules like [Microsoft.Graph](https://learn.microsoft.com/en-us/powershell/microsoftgraph/) for interacting with Microsoft 365 and Azure AD.
- **Deployment**: Use containerization tools like [Docker](https://www.docker.com/) and orchestration platforms like [Kubernetes](https://kubernetes.io/) for scalable deployments.
- **Authentication**: Implement modern authentication protocols like OAuth 2.0 and OpenID Connect using libraries like [IdentityServer](https://identityserver.com/).

## License

This project is proprietary and intended for internal use only. Contact the project owner for licensing details.
