import yargs from "yargs/yargs";
import { hideBin } from "yargs/helpers";

yargs(hideBin(process.argv))
  .command(
    "c1 <arg1>",
    "description",
    (yargs) => {
      return yargs
        .positional("arg1", {
          type: "string",
        })
    },
    (argv) => {
      console.log(argv.arg1);
    }
  )
  .command(
    "c2 <arg2>",
    "description",
    (yargs) => {
      return yargs
        .positional("arg2", {
          type: "string",
        })
    },
    (argv) => {
      console.log(argv.arg2);
    }
  )
  .demandCommand(1)
  .parse();
