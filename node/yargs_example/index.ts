import yargs from "yargs/yargs";
import { hideBin } from "yargs/helpers";

yargs(hideBin(process.argv))
  .command(
    "* <arg1>",
    "description",
    (yargs) => {
      return yargs.positional("arg1", {
        type: "string",
      });
    },
    (argv) => {
      console.log(argv.arg1);
    }
  )
  .parse();
