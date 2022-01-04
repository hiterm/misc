module.exports = {
  testEnvironment: "jsdom",
  transform: {
    '^.+\\.(t|j)sx?$': ['@swc/jest',
      {
        jsc: {
          transform: {
            react: {
              // 必須。省略すると "ReferenceError: React is not defined" が発生します
              runtime: "automatic",
            },
          },
        }
      },
    ],
  },
}
