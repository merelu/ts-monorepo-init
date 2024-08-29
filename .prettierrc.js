module.exports = {
  bracketSpacing: true,
  jsxBracketSameLine: true,
  singleQuote: false,
  trailingComma: "all",
  tabWidth: 2,
  printWidth: 80,
  importOrder: ["^src/(.*)$", "^[./]"],
  importOrderSeparation: true,
  importOrderSortSpecifiers: true,
  importOrderParserPlugins: ["typescript", "decorators-legacy"],
  plugins: [require.resolve("@trivago/prettier-plugin-sort-imports")]
}
