import js from "@eslint/js";
import globals from "globals";

export default [
    // Global ignores
    {
        ignores: [
            "build/**",
            "dist/**",
            "node_modules/**",
            "coverage/**",
            ".cache/**",
            "**/*.min.js",
            "**/*.generated.js",
            "**/qtquickcompiler/**"
        ]
    },

    // JavaScript configuration
    {
        files: [
            "**/*.js",
            "**/*.mjs"
        ],

        languageOptions: {
            ecmaVersion: "latest",
            sourceType: "module",
            globals: {
                ...globals.browser,
                ...globals.node
            }
        },

        plugins: {
            js
        },

        rules: {
            ...js.configs.recommended.rules,

            // Code quality
            "no-unused-vars": [
                "warn",
                {
                    argsIgnorePattern: "^_",
                    varsIgnorePattern: "^_"
                }
            ],
            "no-undef": "error",
            "no-unreachable": "error",
            "no-constant-condition": "warn",
            "no-debugger": "warn",
            "eqeqeq": ["error", "always"],

            // Code style
            "semi": ["error", "always"],
            "quotes": ["error", "double"],
            "curly": ["error", "all"]
        }
    },

    // CommonJS configuration
    {
        files: ["**/*.cjs"],

        languageOptions: {
            ecmaVersion: "latest",
            sourceType: "commonjs",
            globals: {
                ...globals.node
            }
        },

        rules: {
            ...js.configs.recommended.rules,
            "no-unused-vars": "warn"
        }
    }
];
