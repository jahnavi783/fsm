# FSM Project Context Files and Custom Agents

This document provides an overview of all context files and custom agents available for the FSM project.

## Context Files

### 1. FSM_ARCHITECTURE.md
**Location**: `.github/FSM_ARCHITECTURE.md`

Comprehensive guide to the FSM application architecture covering:
- Clean Architecture layers (Domain, Data, Presentation)
- Core infrastructure (DI, Routing, Theme, Network, Storage)
- Feature organization and structure
- Code generation setup
- Testing strategy
- Best practices and common patterns
- Troubleshooting guide

**Use when**: Understanding the overall architecture or implementing new features.

### 2. FSM_CODING_STANDARDS.md
**Location**: `.github/FSM_CODING_STANDARDS.md`

Detailed coding standards and conventions:
- File and class naming conventions
- Architecture patterns for each layer
- Theme and styling guidelines
- Error handling patterns
- Dependency injection rules
- Code organization standards
- Testing standards
- Comments and documentation
- Performance best practices
- Security guidelines
- Git commit standards
- Code review checklist

**Use when**: Writing or reviewing code to ensure consistency.

### 3. FSM_FEATURE_GUIDE.md
**Location**: `.github/FSM_FEATURE_GUIDE.md`

Step-by-step guide for implementing new features:
- Feature development workflow (8 phases)
- Domain layer implementation
- Data layer implementation (DTOs, datasources, repositories)
- Presentation layer implementation (BLoC, pages, widgets)
- Dependency injection setup
- Route configuration
- Code generation
- Testing implementation
- Common tasks and checklist

**Use when**: Implementing a new feature from scratch.

## Custom Agents

### 1. Clean Architecture Expert
**Location**: `.github/agents/clean_architecture_expert.md`

**Specialization**: Clean Architecture patterns and implementation

**Responsibilities**:
- Implementing features following Clean Architecture
- Creating domain entities, repositories, and use cases
- Implementing data layer with DTOs and data sources
- Building presentation layer with BLoC pattern
- Ensuring proper dependency injection

**Use when**: 
- Implementing new features
- Refactoring code to Clean Architecture
- Need help with domain/data/presentation layer separation

### 2. UI/Theme Expert
**Location**: `.github/agents/ui_theme_expert.md`

**Specialization**: Material Design 3 and FSM Design System

**Responsibilities**:
- Implementing UI components using FSM design system
- Creating responsive layouts with ScreenUtil
- Building custom widgets
- Applying proper theming and styling
- Optimizing UI performance
- Ensuring accessibility compliance

**Use when**:
- Building new UI components
- Styling existing components
- Need help with responsive design
- Implementing Material 3 widgets

### 3. BLoC State Management Expert
**Location**: `.github/agents/bloc_expert.md`

**Specialization**: BLoC pattern and state management

**Responsibilities**:
- Implementing BLoCs for features
- Defining events and states with freezed
- Managing complex state transitions
- Handling async operations and errors
- Optimizing BLoC performance
- Writing BLoC tests

**Use when**:
- Creating new BLoCs
- Need help with state management
- Implementing complex state transitions
- Debouncing/throttling events
- Testing BLoCs

### 4. API Integration Expert
**Location**: `.github/agents/api_integration_expert.md`

**Specialization**: API integration and network layer

**Responsibilities**:
- Creating Retrofit API clients
- Implementing data sources
- Configuring Dio interceptors
- Handling network errors
- Managing authentication tokens
- Implementing retry logic
- Optimizing API calls

**Use when**:
- Integrating new APIs
- Need help with network layer
- Implementing authentication
- Error handling for API calls
- Testing API integration

### 5. Testing Expert
**Location**: `.github/agents/testing_expert.md`

**Specialization**: Testing Flutter applications

**Responsibilities**:
- Writing unit tests for business logic
- Creating widget tests for UI components
- Testing BLoCs with bloc_test
- Implementing integration tests
- Setting up mocks and test fixtures
- Maintaining test coverage

**Use when**:
- Writing tests for new features
- Need help with test strategy
- Mocking dependencies
- Integration testing
- Improving test coverage

## How to Use

### For Developers

1. **Starting a new feature?** 
   - Read `FSM_FEATURE_GUIDE.md` for step-by-step instructions
   - Use Clean Architecture Expert agent for implementation

2. **Building UI components?**
   - Reference `lib/core/theme/README.md` for theme system
   - Use UI/Theme Expert agent for implementation

3. **Implementing state management?**
   - Use BLoC Expert agent for guidance

4. **Integrating APIs?**
   - Use API Integration Expert agent

5. **Writing tests?**
   - Use Testing Expert agent

### For AI Assistants

1. **Read relevant context files** before starting work
2. **Delegate to appropriate agents** for specialized tasks
3. **Follow coding standards** from FSM_CODING_STANDARDS.md
4. **Use architectural patterns** from FSM_ARCHITECTURE.md

## Quick Reference

### File Locations

```
.github/
├── FSM_ARCHITECTURE.md          # Architecture overview
├── FSM_CODING_STANDARDS.md      # Coding conventions
├── FSM_FEATURE_GUIDE.md         # Feature implementation guide
└── agents/
    ├── clean_architecture_expert.md
    ├── ui_theme_expert.md
    ├── bloc_expert.md
    ├── api_integration_expert.md
    └── testing_expert.md

lib/core/theme/
└── README.md                    # Theme system documentation
```

### Common Tasks

| Task | Reference | Agent |
|------|-----------|-------|
| New Feature | FSM_FEATURE_GUIDE.md | Clean Architecture Expert |
| UI Component | lib/core/theme/README.md | UI/Theme Expert |
| State Management | FSM_ARCHITECTURE.md | BLoC Expert |
| API Integration | FSM_ARCHITECTURE.md | API Integration Expert |
| Testing | FSM_ARCHITECTURE.md | Testing Expert |
| Code Review | FSM_CODING_STANDARDS.md | Any Expert |

## Maintenance

### Updating Context Files

When the project evolves, update relevant context files:

1. **Architecture changes**: Update `FSM_ARCHITECTURE.md`
2. **New conventions**: Update `FSM_CODING_STANDARDS.md`
3. **Process changes**: Update `FSM_FEATURE_GUIDE.md`
4. **Theme changes**: Update `lib/core/theme/README.md`

### Updating Agents

Update agent files when:
- New patterns are established
- Best practices change
- New tools/packages are added
- Architecture evolves

## Contributing

When adding new context:

1. Determine if it's general (context file) or specialized (agent)
2. Create/update appropriate file
3. Add entry to this summary
4. Test with Claude to ensure usefulness

## Version History

- **v1.0** (2024-11-02): Initial creation
  - Added 3 context files
  - Added 5 custom agents
  - Created summary document
