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

Date: 2017-08-26 09:08:10
*/


-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_order_detail";
CREATE TABLE "public"."t_order_detail" (
"id" int4 DEFAULT nextval('t_order_detail_id_seq'::regclass) NOT NULL,
"order_id" int4 NOT NULL,
"product_id" int4 NOT NULL,
"sku" varchar(128) COLLATE "default" NOT NULL,
"title" varchar(128) COLLATE "default",
"base_img_url" varchar(128) COLLATE "default",
"listing_id" varchar(64) COLLATE "default",
"qty" int4,
"price" float8 DEFAULT 0,
"total_price" float8 DEFAULT 0,
"weight" int4,
"parent_id" float8,
"comment_id" int4 DEFAULT 0,
"original_price" float8 DEFAULT 0,
"warehouse_id" int4,
"warehouse_name" varchar(64) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"create_by" varchar(64) COLLATE "default",
"update_date" timestamp(6) DEFAULT now(),
"update_by" varchar(64) COLLATE "default",
"micro_stock" int4 DEFAULT 0,
"cloud_stock" int4 DEFAULT 0,
"status" int4,
"status_name" varchar(255) COLLATE "default",
"status_remark" varchar(255) COLLATE "default",
"dis_price" float8 DEFAULT 0,
"type" int2 DEFAULT 0,
"return_order_id" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."t_order_detail" IS '订单详细表';
COMMENT ON COLUMN "public"."t_order_detail"."id" IS '主键';
COMMENT ON COLUMN "public"."t_order_detail"."order_id" IS '订单id';
COMMENT ON COLUMN "public"."t_order_detail"."product_id" IS '产品id';
COMMENT ON COLUMN "public"."t_order_detail"."sku" IS '商品编码';
COMMENT ON COLUMN "public"."t_order_detail"."title" IS '商品标题';
COMMENT ON COLUMN "public"."t_order_detail"."base_img_url" IS '主图图片路径';
COMMENT ON COLUMN "public"."t_order_detail"."listing_id" IS '广告id';
COMMENT ON COLUMN "public"."t_order_detail"."qty" IS '数量';
COMMENT ON COLUMN "public"."t_order_detail"."price" IS '单价';
COMMENT ON COLUMN "public"."t_order_detail"."total_price" IS '总价(单价*数量)';
COMMENT ON COLUMN "public"."t_order_detail"."weight" IS '重量，单位g';
COMMENT ON COLUMN "public"."t_order_detail"."parent_id" IS '父条目id';
COMMENT ON COLUMN "public"."t_order_detail"."comment_id" IS '评论id';
COMMENT ON COLUMN "public"."t_order_detail"."original_price" IS '原价';
COMMENT ON COLUMN "public"."t_order_detail"."warehouse_id" IS '仓库id';
COMMENT ON COLUMN "public"."t_order_detail"."warehouse_name" IS '仓库名称';
COMMENT ON COLUMN "public"."t_order_detail"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."t_order_detail"."create_by" IS '创建人';
COMMENT ON COLUMN "public"."t_order_detail"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."t_order_detail"."update_by" IS '更新人';
COMMENT ON COLUMN "public"."t_order_detail"."micro_stock" IS '微仓扣减数量';
COMMENT ON COLUMN "public"."t_order_detail"."cloud_stock" IS '云仓扣减数量';
COMMENT ON COLUMN "public"."t_order_detail"."status" IS '售后状态';
COMMENT ON COLUMN "public"."t_order_detail"."dis_price" IS '分销价，即分销商采购成本价';
COMMENT ON COLUMN "public"."t_order_detail"."type" IS '商品类型,：默认0，赠品为1, 奖品2';
COMMENT ON COLUMN "public"."t_order_detail"."return_order_id" IS '售后单id';

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_order_detail
-- ----------------------------
ALTER TABLE "public"."t_order_detail" ADD PRIMARY KEY ("id");
