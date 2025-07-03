# CaterCraft Admin - Admin Management System

A comprehensive admin management application built with Flutter for catering services. The app enables efficient administration of catering operations including team management, booking oversight, customer management, and feedback collection.

## ✨ Key Features

### 🔑 Admin Authentication System
- **Secure Admin Access**: Email and password-based authentication for administrators
- **Session Management**: Token-based authentication with auto-logout functionality
- **Error Handling**: Comprehensive error messages for various authentication scenarios
- **Splash Screen**: Professional loading experience with admin verification

### 👥 Team Management (Admin Access)
- **Team Member Overview**: View all registered catering service providers
- **Status Management**: Track approval status (Approved/Pending) for team members
- **Company Information**: Complete company profiles with contact details
- **Team Operations**: Delete team members and manage team roster
- **Service Provider Tracking**: Monitor all registered catering companies

### 📋 Booking Management (Admin Access)
- **Comprehensive Booking View**: Monitor all service bookings across the platform
- **Detailed Booking Information**: Customer details, service items, rates, and scheduling
- **Date & Time Tracking**: Complete booking timeline with formatted display
- **Service Coordination**: Track which company/owner is handling each booking
- **Revenue Monitoring**: Service rates and financial tracking per booking

### 👤 Customer Management (Admin Access)
- **Customer Database**: Complete customer profile management
- **Contact Information**: Name, email, mobile number, and address tracking
- **Service History**: Monitor customer engagement and booking patterns
- **Customer Status**: Track active and inactive customers
- **Data Management**: Comprehensive customer relationship management

### 💬 Feedback System (Admin Access)
- **Feedback Collection**: Centralized feedback from customers about services
- **Service Quality Monitoring**: Track feedback by service type and provider
- **Customer Satisfaction**: Monitor customer experience across all services
- **Performance Analytics**: Evaluate service provider performance through feedback
- **Quality Assurance**: Ensure service standards through feedback monitoring

## 🏗️ Architecture & Tech Stack

### 📱 Flutter Framework
- Cross-platform mobile app development
- Material Design UI components with custom theming
- State management using BLoC/Cubit pattern
- Dependency injection with GetIt and Injectable

### 🧠 Clean Architecture Implementation
```
lib/
├── Application/                    # Business Logic Layer (BLoCs & Cubits)
│   ├── booking/                    # Booking management business logic
│   ├── Feedback/                   # Feedback collection and management
│   ├── loggedin/                   # Admin session management
│   ├── signin/                     # Admin authentication logic
│   └── View/                       # Data viewing and team management
│
├── Core/
│   └── Injectable/                 # Dependency injection configuration
│
├── Domain/                         # Business Models & Interfaces
│   ├── bookings/                   # Booking management models
│   ├── Failure/                    # Error handling and failures
│   ├── feedback/                   # Feedback system models
│   ├── LoggedIn/                   # Admin session models
│   ├── SignIn/                     # Authentication models
│   ├── signout/                    # Sign-out functionality
│   ├── Team/                       # Team and customer models
│   └── TokenManager/               # Authentication token management
│
├── Infrastructure/                 # Data Layer & External Services
│   ├── booking/                    # Booking data repositories
│   ├── feedback/                   # Feedback data repositories
│   ├── LoggedIn/                   # Session management repositories
│   ├── SignIn/                     # Authentication repositories
│   ├── signout/                    # Logout repositories
│   ├── team/                       # Team management repositories
│   └── TokenManager/               # Token management repositories
│
├── Presentation/                   # UI Layer
│   ├── Auth/                       # Authentication screens
│   │   ├── signin.dart             # Admin login interface
│   │   └── splash.dart             # Loading and initialization screen
│   ├── common/                     # Shared UI components
│   │   └── snack.dart              # Notification system
│   └── Home/                       # Main dashboard and navigation
│       ├── home.dart               # Admin dashboard
│       ├── Bookings/               # Booking management screens
│       ├── Customers/              # Customer management interface
│       ├── Feedback/               # Feedback viewing interface
│       └── Teams/                  # Team management screens
│
├── constants/                      # App constants and configuration
│   └── const.dart                  # UI constants and API base URL
│
└── main.dart                       # App entry point (CaterPro)
```

## 🔧 Key Technologies

### State Management:
- **BLoC/Cubit pattern** for predictable state management
- **Flutter BLoC library** for reactive programming
- **GetIt** for dependency injection service locator
- **Injectable** for code generation and DI setup

### Backend & Data:
- **Shared Preferences** for local data persistence
- **Dio** for HTTP networking and API calls
- **RESTful API Integration** with comprehensive error handling

### UI & User Experience:
- **Material Design** components and theming
- **Google Fonts** for enhanced typography
- **Custom Card Layouts** for professional data presentation
- **Responsive Design** for various screen sizes
- **Loading States** with CircularProgressIndicator

### Functional Programming:
- **Dartz** for functional programming paradigms
- **Freezed** for immutable data classes and unions
- **Error handling** with Either types and custom failure models
- **Type-safe** state management

## 📱 Core Functionalities

### Admin Dashboard
- **Centralized Management**: Single dashboard for all catering operations
- **Quick Navigation**: Easy access to Teams, Bookings, Customers, and Feedback
- **Modern UI**: Professional Material Design interface with gradient backgrounds
- **Admin Identification**: Clear admin branding and user identification

### Team Operations Management
- **Service Provider Oversight**: Monitor all registered catering companies
- **Approval Workflow**: Manage team member approval status
- **Company Profiles**: Complete business information for each team member
- **Performance Tracking**: Monitor service provider performance and reliability

### Booking Administration
- **Complete Booking Oversight**: View all service bookings across the platform
- **Service Coordination**: Track service assignments and provider responsibilities
- **Customer Communication**: Access to complete customer contact information
- **Financial Monitoring**: Track service rates and revenue per booking

### Customer Relationship Management
- **Customer Database**: Comprehensive customer profile management
- **Service History**: Track customer engagement and service patterns
- **Communication Management**: Centralized customer contact information
- **Relationship Analytics**: Monitor customer satisfaction and retention

### Quality Assurance
- **Feedback Analysis**: Monitor service quality through customer feedback
- **Service Standards**: Ensure consistent service delivery across all providers
- **Performance Metrics**: Evaluate team member performance through feedback
- **Continuous Improvement**: Use feedback data for service enhancement

## 📱 Getting Started

### Prerequisites
- Flutter SDK (>= 3.7.2)
- Dart SDK (>= 3.7.2)
- Android Studio or VS Code with Flutter extensions

### Installation

#### 1. Clone the repository
```bash
git clone <repository-url>
cd catering
```

#### 2. Install dependencies
```bash
flutter pub get
```

#### 3. Generate dependency injection files
```bash
flutter packages pub run build_runner build
```

#### 4. Run the application
```bash
flutter run
```

## 💡 User Experience

### Professional Design
- **Clean Admin Interface**: Modern Material Design with professional color schemes
- **Intuitive Navigation**: Clear navigation patterns optimized for admin workflows
- **Responsive Layouts**: Optimized for different screen sizes and orientations
- **Loading States**: Professional loading indicators and error handling

### Real-time Operations
- **Instant Updates**: Real-time data synchronization across the application
- **Offline Capability**: Local storage for critical admin data
- **Error Recovery**: Comprehensive error handling with user-friendly messages

## 🔐 Security & Data Management

### Admin Security
- **Secure Authentication**: Email/password authentication with token management
- **Session Management**: Automatic session handling with secure logout
- **Data Encryption**: All data encrypted in transit and at rest
- **Access Control**: Admin-only access to sensitive business data

### Data Privacy
- **Customer Data Protection**: Secure handling of customer information
- **Business Data Security**: Protected access to booking and financial data
- **Error Logging**: Comprehensive logging for troubleshooting without exposing sensitive data

## 📊 Admin Features & Access Levels

### 🏢 Admin (Full System Access)
**Complete Administrative Control**
- **Team Management**: View, approve, and manage all catering service providers
- **Booking Oversight**: Monitor all service bookings and customer interactions
- **Customer Database**: Access complete customer profiles and service history
- **Feedback Analysis**: Review all customer feedback and service quality metrics
- **Business Intelligence**: Comprehensive view of all platform operations
- **Quality Control**: Ensure service standards across all team members

## 🔐 System Architecture

The application implements a robust admin-focused architecture:
- **Authentication**: admin login with session management
- **Authorization**: Admin-only access to all platform data and operations
- **Session Management**: Automatic session handling with secure logout functionality

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues, feature requests, or pull requests.

### Development Setup
1. Fork the repository
2. Create a feature branch
3. Make your changes following the clean architecture pattern
4. Test thoroughly with the existing BLoC pattern
5. Submit a pull request

## 🔮 Future Roadmap

- **Advanced Analytics Dashboard**: Enhanced reporting and business intelligence
- **Push Notifications**: Real-time notifications for critical admin events
- **Multi-language Support**: Internationalization for global catering operations
- **Advanced Search & Filtering**: Enhanced data discovery capabilities
- **Export Functionality**: Data export for external reporting and analysis
- **Performance Metrics**: Advanced KPI tracking and performance analytics

## 📈 Business Impact

### Operational Efficiency
- **Centralized Management**: Single point of control for all catering operations
- **Streamlined Workflows**: Efficient admin processes for team and booking management
- **Quality Assurance**: Systematic monitoring of service quality and customer satisfaction
- **Data-Driven Decisions**: Comprehensive data access for informed business decisions

### Service Excellence
- **Team Coordination**: Effective management of catering service providers
- **Customer Experience**: Enhanced customer service through comprehensive data access
- **Quality Control**: Systematic feedback monitoring and service improvement
- **Performance Tracking**: Monitor and improve service provider performance

## 👨‍💻 Developer

Developed with ❤️ for Catering Service Administration

For questions or support, please open an issue on GitHub.

---

**About**: CaterCraft Admin is a comprehensive admin management system built with Flutter, designed specifically for managing catering service operations. It features team management, booking oversight, customer relationship management, and quality assurance through feedback monitoring, all within a professional administrative interface.
