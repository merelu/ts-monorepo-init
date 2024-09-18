import { TestCommon } from "@libs/common";
import { Injectable } from "@nestjs/common";

@Injectable()
export class AppService {
  getHello(): string {
    const a = new TestCommon();
    console.log(a);
    return "Hello World!";
  }
}
