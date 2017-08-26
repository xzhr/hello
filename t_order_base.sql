/*
Navicat PGSQL Data Transfer

Source Server         : Tomtopdev
Source Server Version : 90315
Source Host           : 192.168.223.14:5432
Source Database       : m_order
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90315
File Encoding         : 65001

Date: 2017-08-26 09:07:53
*/


-- ----------------------------
-- Table structure for t_order_base
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_order_base";
CREATE TABLE "public"."t_order_base" (
"id" int4 DEFAULT nextval('t_order_base_id_seq'::regclass) NOT NULL,
"site_id" int4 NOT NULL,
"site_host" varchar(128) COLLATE "default" NOT NULL,
"account_id" int4 NOT NULL,
"account_name" varchar(64) COLLATE "default",
"receipter_name" varchar(32) COLLATE "default",
"receipter_idcard" varchar(32) COLLATE "default",
"receipter_postcode" varchar(32) COLLATE "default",
"receipter_province" varchar(16) COLLATE "default",
"receipter_city" varchar(16) COLLATE "default",
"receipter_address" varchar(64) COLLATE "default",
"receipter_cellphone" varchar(32) COLLATE "default",
"storage_id" int4,
"storage_name" varchar(32) COLLATE "default",
"shipping_code" varchar(32) COLLATE "default",
"shipping_price" float8 DEFAULT 0,
"order_subtotal" float8 DEFAULT 0,
"extra_price" float8 DEFAULT 0,
"grand_total" float8 DEFAULT 0,
"payment_amount" float8 DEFAULT 0,
"quantity_total" int4,
"status" int4,
"status_name" varchar(32) COLLATE "default",
"status_remark" varchar(32) COLLATE "default",
"payment_id" varchar(32) COLLATE "default",
"payment_card_type" varchar(32) COLLATE "default",
"payment_card_id" varchar(32) COLLATE "default",
"payment_user_fullname" varchar(32) COLLATE "default",
"order_user_name" varchar(32) COLLATE "default",
"order_user_idcard" varchar(32) COLLATE "default",
"order_user_cellphone" varchar(32) COLLATE "default",
"currency" varchar(32) COLLATE "default",
"leave_message" varchar(1024) COLLATE "default",
"transaction_id" varchar(64) COLLATE "default",
"totaltax" float8,
"order_no" varchar(64) COLLATE "default",
"is_deleted" bool DEFAULT false,
"pushed" bool DEFAULT false,
"create_date" timestamp(6) DEFAULT now(),
"create_by" varchar(64) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"update_by" varchar(64) COLLATE "default",
"platform_amount" float8 DEFAULT 0,
"address_id" int4,
"order_profit" float8 DEFAULT 0,
"activity_id" int4,
"benefit_amount" float8 DEFAULT 0,
"discount" float8 DEFAULT 100,
"origin_total" float8 DEFAULT 0,
"balance_order_id" int4,
"mfreight" float8 DEFAULT 0,
"site_name" varchar(64) COLLATE "default",
"monitor_token" varchar(255) COLLATE "default",
"origin_client" varchar(32) COLLATE "default",
"coupon_id" int4,
"coupon_denomination" float8,
"group_id" int4,
"account_logo" varchar(255) COLLATE "default",
"refund_amount" float8 DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."t_order_base" IS '订单主表';
COMMENT ON COLUMN "public"."t_order_base"."id" IS '主键';
COMMENT ON COLUMN "public"."t_order_base"."site_id" IS '站点id';
COMMENT ON COLUMN "public"."t_order_base"."site_host" IS '站点url';
COMMENT ON COLUMN "public"."t_order_base"."account_id" IS '账户id';
COMMENT ON COLUMN "public"."t_order_base"."account_name" IS '账户昵称';
COMMENT ON COLUMN "public"."t_order_base"."receipter_name" IS '收货人姓名';
COMMENT ON COLUMN "public"."t_order_base"."receipter_idcard" IS '收货人身份证号';
COMMENT ON COLUMN "public"."t_order_base"."receipter_postcode" IS '收货人邮政编码';
COMMENT ON COLUMN "public"."t_order_base"."receipter_province" IS '收货人省份';
COMMENT ON COLUMN "public"."t_order_base"."receipter_city" IS '收货人城市';
COMMENT ON COLUMN "public"."t_order_base"."receipter_address" IS '收货人详细地址';
COMMENT ON COLUMN "public"."t_order_base"."receipter_cellphone" IS '收货人电话号码';
COMMENT ON COLUMN "public"."t_order_base"."storage_id" IS '仓库id';
COMMENT ON COLUMN "public"."t_order_base"."storage_name" IS '仓库名称';
COMMENT ON COLUMN "public"."t_order_base"."shipping_code" IS '物流代码';
COMMENT ON COLUMN "public"."t_order_base"."shipping_price" IS '物流费用';
COMMENT ON COLUMN "public"."t_order_base"."order_subtotal" IS '基本费用';
COMMENT ON COLUMN "public"."t_order_base"."extra_price" IS '额外费用';
COMMENT ON COLUMN "public"."t_order_base"."grand_total" IS '订单总额';
COMMENT ON COLUMN "public"."t_order_base"."payment_amount" IS '付款金额(传给第三方支付平台的数字)';
COMMENT ON COLUMN "public"."t_order_base"."quantity_total" IS '订单总数量';
COMMENT ON COLUMN "public"."t_order_base"."status" IS '状态码，对应t_order_status';
COMMENT ON COLUMN "public"."t_order_base"."status_name" IS '当前状态名称';
COMMENT ON COLUMN "public"."t_order_base"."status_remark" IS '状态备注：显示当前状态下，用户的下一步动作；如status_name为已生成，status_remark应该为等待付款';
COMMENT ON COLUMN "public"."t_order_base"."payment_id" IS '支付方式';
COMMENT ON COLUMN "public"."t_order_base"."payment_card_type" IS '支付人证件类型';
COMMENT ON COLUMN "public"."t_order_base"."payment_card_id" IS '支付人证件id';
COMMENT ON COLUMN "public"."t_order_base"."payment_user_fullname" IS '支付人全名';
COMMENT ON COLUMN "public"."t_order_base"."order_user_name" IS '订购人全名';
COMMENT ON COLUMN "public"."t_order_base"."order_user_idcard" IS '订购人身份证';
COMMENT ON COLUMN "public"."t_order_base"."order_user_cellphone" IS '订购人手机号';
COMMENT ON COLUMN "public"."t_order_base"."currency" IS '结算货币';
COMMENT ON COLUMN "public"."t_order_base"."leave_message" IS '用户留言';
COMMENT ON COLUMN "public"."t_order_base"."transaction_id" IS '交易号';
COMMENT ON COLUMN "public"."t_order_base"."totaltax" IS '订单总税费';
COMMENT ON COLUMN "public"."t_order_base"."order_no" IS '订单编号，平台自己的生成规则';
COMMENT ON COLUMN "public"."t_order_base"."is_deleted" IS '是否删除';
COMMENT ON COLUMN "public"."t_order_base"."pushed" IS '是否被推送到hk';
COMMENT ON COLUMN "public"."t_order_base"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."t_order_base"."create_by" IS '创建人';
COMMENT ON COLUMN "public"."t_order_base"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."t_order_base"."update_by" IS '更新人';
COMMENT ON COLUMN "public"."t_order_base"."platform_amount" IS '平台收入';
COMMENT ON COLUMN "public"."t_order_base"."address_id" IS '收货地址id';
COMMENT ON COLUMN "public"."t_order_base"."order_profit" IS '订单的总利润';
COMMENT ON COLUMN "public"."t_order_base"."activity_id" IS '参与促销活动id';
COMMENT ON COLUMN "public"."t_order_base"."benefit_amount" IS '优惠金额（满减活动）';
COMMENT ON COLUMN "public"."t_order_base"."discount" IS '折扣（打折活动）';
COMMENT ON COLUMN "public"."t_order_base"."origin_total" IS '订单原始总额（没减优惠）';
COMMENT ON COLUMN "public"."t_order_base"."balance_order_id" IS '补差订单ID,对应t_payment_order表';
COMMENT ON COLUMN "public"."t_order_base"."mfreight" IS 'm站设置的上浮或增加的邮费金额';
COMMENT ON COLUMN "public"."t_order_base"."site_name" IS '站点名称';
COMMENT ON COLUMN "public"."t_order_base"."monitor_token" IS '监控渠道token';
COMMENT ON COLUMN "public"."t_order_base"."origin_client" IS '订单来源：app表示来源APP客户端，web表示来源';
COMMENT ON COLUMN "public"."t_order_base"."coupon_id" IS '优惠券id';
COMMENT ON COLUMN "public"."t_order_base"."coupon_denomination" IS '优惠券金额';
COMMENT ON COLUMN "public"."t_order_base"."group_id" IS '拼购团id，对应t_group_buy的id';
COMMENT ON COLUMN "public"."t_order_base"."account_logo" IS '用户头像';
COMMENT ON COLUMN "public"."t_order_base"."refund_amount" IS '退款金额';

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_order_base
-- ----------------------------
ALTER TABLE "public"."t_order_base" ADD PRIMARY KEY ("id");
