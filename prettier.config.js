// prettier.config.js, .prettierrc.js, prettier.config.mjs, or .prettierrc.mjs

/**
 * @see https://prettier.io/docs/en/configuration.html
 * @type {import("prettier").Config}
 */
const config = {
    singleQuote: true,
    semi: true,
    tabWidth: 4,
    trailingComma: 'all',
    bracketSpacing: true,
    insert_final_newline: true,
    trim_trailing_whitespace: true,
    max_line_length: 80,
    overrides: [
        {
            files: ['*.html', '*.tsx', '*.jsx'],
            options: {
                tabWidth: 2,
            },
        },
        {
            files: ['*.md'],
            options: {
                parser: 'mdx',
            },
        },
        {
            files: ['*.yml', '*.yaml'],
            options: {
                singleQuote: false,
            },
        },
    ],
};

module.exports = config;
// export default config;
