module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    // You can add or override rules here
    'type-enum': [2, 'always', ['feat', 'fix', 'chore', 'docs', 'style', 'refactor', 'test', 'revert']],
    'scope-enum': [2, 'always', ['example', 'feature', 'bugfix']],
    // Customize your rules according to your needs
  },
};

