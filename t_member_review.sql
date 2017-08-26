/*
Navicat PGSQL Data Transfer

Source Server         : Tomtopdev
Source Server Version : 90315
Source Host           : 192.168.223.14:5432
Source Database       : m_member
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90315
File Encoding         : 65001

Date: 2017-08-26 09:03:40
*/


-- ----------------------------
-- Table structure for t_member_review
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_member_review";
CREATE TABLE "public"."t_member_review" (
"id" int4 DEFAULT nextval('t_member_review_id_seq'::regclass) NOT NULL,
"sku" varchar(255) COLLATE "default",
"head_logo_url" varchar(200) COLLATE "default",
"reviewer" varchar(64) COLLATE "default",
"content" varchar(1000) COLLATE "default",
"create_date" timestamp(6) DEFAULT now(),
"site_id" int4,
"auth_id" int4,
"order_no" varchar(64) COLLATE "default",
"product_title" varchar(200) COLLATE "default",
"product_img" varchar(500) COLLATE "default",
"product_id" int4,
"show" bool DEFAULT true,
"estimation_scale" varchar(1) COLLATE "default" DEFAULT 0,
"estimate_imgs" varchar[] COLLATE "default",
"anon" varchar(1) COLLATE "default" DEFAULT 1,
"price" float8 DEFAULT 0,
"qty" int4 DEFAULT 1,
"order_id" int4 DEFAULT 0
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."t_member_review" IS '评论表';
COMMENT ON COLUMN "public"."t_member_review"."head_logo_url" IS '用户头像链接';
COMMENT ON COLUMN "public"."t_member_review"."reviewer" IS '评论人（可以是昵称或邮箱或手机，根据需要选择性填充）';
COMMENT ON COLUMN "public"."t_member_review"."content" IS '评论内容';
COMMENT ON COLUMN "public"."t_member_review"."site_id" IS '站点id';
COMMENT ON COLUMN "public"."t_member_review"."auth_id" IS '用户id';
COMMENT ON COLUMN "public"."t_member_review"."order_no" IS '订单编号';
COMMENT ON COLUMN "public"."t_member_review"."product_title" IS '商品标题';
COMMENT ON COLUMN "public"."t_member_review"."product_img" IS '商品图片';
COMMENT ON COLUMN "public"."t_member_review"."product_id" IS '商品id';
COMMENT ON COLUMN "public"."t_member_review"."show" IS '商品详情页是否显示，默认true显示';
COMMENT ON COLUMN "public"."t_member_review"."estimation_scale" IS '评价的等级';
COMMENT ON COLUMN "public"."t_member_review"."estimate_imgs" IS '评价上传的图片，最多三张';
COMMENT ON COLUMN "public"."t_member_review"."anon" IS '是否匿名评价，默认是1表示匿名';
COMMENT ON COLUMN "public"."t_member_review"."price" IS '单价';
COMMENT ON COLUMN "public"."t_member_review"."qty" IS '数量';
COMMENT ON COLUMN "public"."t_member_review"."order_id" IS '订单的ID';

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table t_member_review
-- ----------------------------
ALTER TABLE "public"."t_member_review" ADD PRIMARY KEY ("id");
