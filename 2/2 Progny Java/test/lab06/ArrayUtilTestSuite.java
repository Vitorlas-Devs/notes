

import org.junit.platform.suite.api.SelectClasses;
import org.junit.platform.suite.api.Suite;

import array.util.ArrayUtil;

@Suite
@SelectClasses({
	ArrayUtil.class,
	ArrayUtilTest.class
})
public class ArrayUtilTestSuite {}

