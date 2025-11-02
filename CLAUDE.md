# Math Trainer

## Project Overview
MathTrainer is an app that will help people to learn and practice simple mathematical operations.
Goal is to be fast, and also entertaining so children spend a good time.

## Technology Stack
- **Backend**: Ruby on Rails (latest guidelines and conventions)
- **Database**: PostgreSQL
- **Frontend**: 
  - **Template Engine**: Slim (preferred) with `div class="..."` syntax for Tailwind CSS
  - **CSS Framework**: Tailwind CSS (migrating from Bootstrap)
  - **JavaScript**: Stimulus controllers (prefer https://www.stimulus-components.com/ over custom controllers)
- **Testing**: RSpec with FactoryBot, Faker, Timecop
- **Code Quality**: RuboCop for linting

## Development Preferences

### Template Files
- **Preferred**: Slim templates with `div class="..."` syntax for easy Tailwind CSS class copying
- **Legacy**: Some HAML files exist but should be migrated to Slim when touched
- **CSS Classes**: Use Tailwind CSS classes, avoid Bootstrap classes

### Stimulus Controllers
- **Preferred approach**: Use components from https://www.stimulus-components.com/
- **Avoid**: Creating new custom Stimulus controllers when existing components can solve the problem
- **Research first**: Check stimulus-components.com before writing custom JavaScript

### Code Style
- Follow latest Rails guidelines and conventions
- Use RuboCop for code formatting
- Write tests for new features
- Follow existing patterns in the codebase

### Test Driven Development
When developping a feature, write the tests first.
For user facing feature, use system test to test nominal cases.
Add unit tests for new methods created on model or services layers.
Don't test trivial methods.

### Pre-Commit Workflow
**ALWAYS run these commands before committing:**
1. `bin/rspec` - Run tests to ensure functionality works
2. `bin/rubocop -A` - Auto-fix all RuboCop style issues
3. Commit changes only after both pass successfully

This ensures code quality and style compliance before creating PRs.

## Important Commands
- **Tests**: `bin/rspec`
- **Linting**: `bin/rubocop`
- **Database**: Standard Rails migration commands using `bin/rails`

## Development Guidelines
1. **Follow latest Rails guidelines** - use current Rails conventions and best practices
2. **Always run tests** when making changes to ensure functionality works
3. **Follow existing code patterns** - look at similar implementations before creating new features  
4. **Use proper Tailwind classes** - avoid Bootstrap classes, migrate when found
5. **Prefer Stimulus Components** - check https://www.stimulus-components.com/ before creating custom controllers
6. **Write tests** for new functionality using RSpec and FactoryBot patterns
7. **Prefer editing existing files** over creating new ones when possible
8. **Use Slim template syntax** with `div class="..."` for easy Tailwind integration

### Specific coding style
- avoid unless? prefer if. For exemple, `return unless prev_season` should be replaced by `return if prev_season.blank?`