/**  
 * @Title: Test.java
 * @Package alibaba
 * @Des: TODO
 * @author hesin  
 * @date 2015年8月28日 下午5:35:26
 * @version V1.0  
 */
package test;

import com.alibaba.openapi.client.AlibabaClient;
import com.alibaba.openapi.client.policy.ClientPolicy;

/**
 * @ClassName: Test
 * @Des: TODO
 * @author hesin
 * @date 2015年8月28日 下午5:35:26
 */
public class Test {

	/**
	 * @Title: main
	 * @Des: TODO
	 * @param args void
	 * @throws
	 */
	public static void main(String[] args) {
		// 使用自定义的client策略，包括使用域名gw.api.alibaba.com,端口默认为http 80，https 443
		ClientPolicy policy = new ClientPolicy("gw.api.alibaba.com");
		// 设置app的appKey以及对应的密钥，信息由注册app时生成
		policy = policy.setAppKey("3121164").setSigningKey("HFaRcUCO19O");
		// 使用client策略来初始化AlibabaClient,建议保持单例
		AlibabaClient client = new AlibabaClient(policy);
		// 启动AlibabaClient实例
		client.start();

		// 用户通过应用市场来访问app时，会带code参数，app通过这个code来换取用户的授权信息
		// AuthorizationToken authorizationToken = client.getToken(YOUR_CODE);
		// 如果已经有用户的授权信息，可以通过已有的refreshToken来换取新的access_token
		// AuthorizationToken authorizationToken = client.refreshToken(YOUR_REFRESH_TOKEN);
	}
}
