# FSM Project Documentation

This directory contains comprehensive documentation and custom agents for the FSM (Field Service Management) Flutter application.

## 📊 Documentation Statistics

- **Total Lines**: ~4,642 lines of documentation
- **Context Files**: 4 comprehensive guides
- **Custom Agents**: 5 specialized experts
- **Coverage**: Architecture, Coding Standards, Features, UI, State, API, Testing

## 📁 Directory Structure

```
.github/
├── README.md                     # This file
├── FSM_ARCHITECTURE.md           # 450+ lines - Architecture guide
├── FSM_CODING_STANDARDS.md       # 500+ lines - Coding conventions
├── FSM_FEATURE_GUIDE.md          # 750+ lines - Feature implementation
├── FSM_CONTEXT_SUMMARY.md        # 200+ lines - Overview document
└── agents/                       # Custom expert agents
    ├── clean_architecture_expert.md   # 150+ lines
    ├── ui_theme_expert.md            # 200+ lines
    ├── bloc_expert.md                # 400+ lines
    ├── api_integration_expert.md     # 500+ lines
    └── testing_expert.md             # 650+ lines
```

## 🎯 Quick Start

### For New Developers

1. **Read First**: `FSM_ARCHITECTURE.md` - Understand the project structure
2. **Reference**: `FSM_CODING_STANDARDS.md` - Learn coding conventions
3. **Implement**: `FSM_FEATURE_GUIDE.md` - Follow when building features
4. **Theme**: `../lib/core/theme/README.md` - UI styling guide

### For AI Assistants (Claude, etc.)

1. **Read**: `FSM_CONTEXT_SUMMARY.md` - Overview of all resources
2. **Delegate**: Use custom agents in `agents/` for specialized tasks
3. **Follow**: Standards from `FSM_CODING_STANDARDS.md`
4. **Reference**: Patterns from `FSM_ARCHITECTURE.md`

## 📚 Context Files

### 1. FSM_ARCHITECTURE.md
**Purpose**: Comprehensive architecture guide  
**Topics**:
- Clean Architecture layers (Domain, Data, Presentation)
- Core infrastructure (DI, Routing, Network, Storage)
- Feature organization
- Code generation
- Best practices

**Use when**: Need to understand architecture or implement features

### 2. FSM_CODING_STANDARDS.md
**Purpose**: Coding conventions and standards  
**Topics**:
- Naming conventions (files, classes, variables)
- Architecture patterns for each layer
- Theme and styling guidelines
- Error handling patterns
- Testing standards
- Code review checklist

**Use when**: Writing or reviewing code

### 3. FSM_FEATURE_GUIDE.md
**Purpose**: Step-by-step feature implementation  
**Topics**:
- 8-phase development workflow
- Domain layer implementation
- Data layer implementation
- Presentation layer implementation
- DI setup and routing
- Testing strategies

**Use when**: Implementing a new feature from scratch

### 4. FSM_CONTEXT_SUMMARY.md
**Purpose**: Overview of all context files and agents  
**Topics**:
- Summary of all documentation
- How to use each resource
- Quick reference tables
- Common tasks mapping

**Use when**: Need to find the right resource

## 🤖 Custom Agents

### 1. Clean Architecture Expert
**File**: `agents/clean_architecture_expert.md`  
**Expertise**: Clean Architecture, domain/data/presentation layers  
**Use for**:
- Implementing new features
- Refactoring to Clean Architecture
- Creating entities, repositories, use cases
- Setting up dependency injection

### 2. UI/Theme Expert
**File**: `agents/ui_theme_expert.md`  
**Expertise**: Material Design 3, FSM theme system, responsive design  
**Use for**:
- Building UI components
- Applying FSM design system
- Creating responsive layouts
- Accessibility compliance

### 3. BLoC Expert
**File**: `agents/bloc_expert.md`  
**Expertise**: BLoC pattern, state management, rxdart  
**Use for**:
- Creating BLoCs
- Managing complex state transitions
- Debouncing/throttling events
- Testing BLoCs

### 4. API Integration Expert
**File**: `agents/api_integration_expert.md`  
**Expertise**: Retrofit, Dio, network layer, authentication  
**Use for**:
- Integrating APIs
- Configuring interceptors
- Error handling
- Token management

### 5. Testing Expert
**File**: `agents/testing_expert.md`  
**Expertise**: Unit, widget, BLoC, integration testing  
**Use for**:
- Writing comprehensive tests
- Mocking dependencies
- Golden testing
- Improving coverage

## 🎓 Learning Path

### Beginner
1. Read `FSM_ARCHITECTURE.md` - Understand the basics
2. Read `FSM_CODING_STANDARDS.md` - Learn conventions
3. Follow a simple task from `FSM_FEATURE_GUIDE.md`
4. Use Clean Architecture Expert agent for help

### Intermediate
1. Implement a complete feature using `FSM_FEATURE_GUIDE.md`
2. Use multiple agents (Architecture, BLoC, UI)
3. Write tests using Testing Expert
4. Review code against `FSM_CODING_STANDARDS.md`

### Advanced
1. Refactor existing features to improve architecture
2. Create new patterns and update documentation
3. Contribute to context files and agents
4. Mentor others using these resources

## 🔄 Common Workflows

### Implementing a New Feature
1. Read `FSM_FEATURE_GUIDE.md`
2. Use Clean Architecture Expert for domain/data layers
3. Use UI/Theme Expert for presentation layer
4. Use BLoC Expert for state management
5. Use Testing Expert for tests

### Building UI Components
1. Reference `lib/core/theme/README.md`
2. Check `FSM_CODING_STANDARDS.md` for UI standards
3. Use UI/Theme Expert agent
4. Test with Widget Testing Expert

### Integrating an API
1. Reference `FSM_ARCHITECTURE.md` data layer section
2. Use API Integration Expert agent
3. Follow error handling patterns from standards
4. Test with Testing Expert

### Writing Tests
1. Reference testing section in `FSM_ARCHITECTURE.md`
2. Follow standards from `FSM_CODING_STANDARDS.md`
3. Use Testing Expert agent
4. Aim for >80% coverage

## 🛠 Maintenance

### Updating Documentation

When the project evolves, update relevant files:

- **Architecture changes** → Update `FSM_ARCHITECTURE.md`
- **New conventions** → Update `FSM_CODING_STANDARDS.md`
- **Process changes** → Update `FSM_FEATURE_GUIDE.md`
- **New patterns** → Update relevant agent files
- **Major changes** → Update `FSM_CONTEXT_SUMMARY.md`

### Document Versioning

Track significant documentation changes in `FSM_CONTEXT_SUMMARY.md` version history.

## 💡 Tips

### For Developers
- Keep context files open while working
- Reference coding standards during code review
- Use feature guide as a checklist
- Ask agents for help with complex tasks

### For AI Assistants
- Always read relevant context files first
- Delegate to specialized agents when appropriate
- Follow patterns from documentation
- Maintain consistency with standards

### For Reviewers
- Use `FSM_CODING_STANDARDS.md` checklist
- Verify architecture matches `FSM_ARCHITECTURE.md`
- Check test coverage meets standards
- Ensure UI follows theme system

## 📞 Getting Help

1. **Can't find something?** → Check `FSM_CONTEXT_SUMMARY.md`
2. **Architecture questions?** → Read `FSM_ARCHITECTURE.md`
3. **How to implement?** → Follow `FSM_FEATURE_GUIDE.md`
4. **Code style?** → Reference `FSM_CODING_STANDARDS.md`
5. **Need expert help?** → Use relevant agent from `agents/`

## 🎉 Benefits

Using this documentation:
- ✅ Consistent code across the project
- ✅ Faster onboarding for new developers
- ✅ Better code quality and maintainability
- ✅ AI assistants can work more effectively
- ✅ Reduced code review time
- ✅ Clear architectural guidelines
- ✅ Comprehensive testing strategies

## 📝 Contributing

To contribute to this documentation:

1. Identify gaps or outdated information
2. Draft updates following existing format
3. Test with actual development scenarios
4. Update version history in summary
5. Submit for review

## 🔗 Related Documentation

- **Main README**: `../README.md` - Project overview
- **Theme Documentation**: `../lib/core/theme/README.md` - Design system
- **CLAUDE.md**: `../CLAUDE.md` - AI assistant guidance
- **Work Notes**: `../work.txt` - Current work tracking

---

**Last Updated**: 2024-11-02  
**Version**: 1.0  
**Maintained by**: FSM Development Team
