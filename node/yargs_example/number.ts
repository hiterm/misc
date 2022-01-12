import yargs from "yargs/yargs";
import { hideBin } from "yargs/helpers";

yargs(hideBin(process.argv))
  .command(
    "* <arg1>",
    "description",
    (yargs) => {
      return yargs
        .option("option", {
          alias: "o",
          type: "number",
          demandOption: true,
        })
        .positional("arg1", {
          type: "string",
          demandOption: true,
        });
    },
    (argv) => {
      console.log(argv.arg1);
      console.log(argv.option);
    }
  )
  .parse();
